import 'package:alan/alan.dart';
import 'package:alan/wallet/export.dart';
import 'package:d_email_flutter_client/data/address/provider.dart';
import 'package:d_email_flutter_client/data/email/provider.dart';

import 'package:alan/wallet/network_info.dart';
import 'package:d_email_flutter_client/data/core/repository.dart';
import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:d_email_flutter_client/ipfs_client/dart_ipfs_client.dart';
import 'package:hive/hive.dart';

import 'model.dart';

class EmailRepository extends Repository {
  final NetworkInfo demailNetworkInfo;
  final Ipfs ipfs;
  final Box<Email> emailBox;
  final Box<String> flagsBox;
  DEmailEmailProvider? emailProvider;

  EmailRepository(
      this.demailNetworkInfo, this.ipfs, this.emailBox, this.flagsBox) {
    var addressProvider = DEmailAddressProvider(this.demailNetworkInfo);
    this.emailProvider =
        DEmailEmailProvider(demailNetworkInfo, addressProvider, this.ipfs);
  }

  Future<void> sendEmail(Email? replyTo, User user, List<String> to,
      String subject, String body) async {
    Email email =
        await this.emailProvider!.sendEmail(replyTo, user, to, subject, body);
    await this.emailBox.put(email.id, email);
  }

  Future<List<Email>> findAllUserEmails(User user) async {
    return await this.emailProvider!.getAllUserEmails(user);
  }

  @override
  void dispose() {
    this.emailBox.close();
    this.flagsBox.close();
  }
}
