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
    await this.emailBox.put("${email.id}-${user.email}", email);
  }

  Future<List<Email>> findAllUserEmails(User user) async {
    Map<String, Email> cache = loadAllUserEmails(user);
    List<Email> emails = cache.values.toList();

    List<Email> loadedEmails =
        await this.emailProvider!.getAllUserEmails(user, cache);

    loadedEmails.forEach((element) {
      if (!cache.containsKey(element.id)) {
        emailBox.put("${element.id}-${user.email}", element);
      }
    });

    emails.addAll(loadedEmails);

    Map<String, bool> relationMap = {};
    emails.forEach((element) {
      if (!relationMap.containsKey(element.id)) {
        relationMap[element.id] = false;
      }

      if (element.previous != null) {
        relationMap[element.previous!.id] = true;
      }
    });

    List<Email> result = [];
    Map<String, bool> resultMap = {};
    emails.forEach((element) {
      if (!resultMap.containsKey(element.id)) {
        if (!relationMap[element.id]!) {
          if (element.from != user.email) {
            result.add(element);
            resultMap[element.id] = true;
          } else if (element.previous != null) {
            Email? previous = element.previous;
            while (previous != null && previous.from == user.email) {
              previous = previous.previous;
            }

            if (previous != null) {
              if (!resultMap.containsKey(previous.id)) {
                result.add(previous);
                resultMap[previous.id] = true;
              }
            }
          }
        }
      }
    });

    return result;
  }

  Future<List<Email>> findAllUserSentEmails(User user) async {
    Map<String, Email> mapEmails = loadAllUserEmails(user);
    List<Email> emails = mapEmails.values.toList();

    Map<String, bool> relationMap = {};
    emails.forEach((element) {
      if (!relationMap.containsKey(element.id)) {
        relationMap[element.id] = false;
      }

      if (element.previous != null) {
        relationMap[element.previous!.id] = true;
      }
    });

    List<Email> result = [];
    Map<String, bool> resultMap = {};
    emails.forEach((element) {
      if (!resultMap.containsKey(element.id)) {
        if (!relationMap[element.id]!) {
          if (element.from == user.email) {
            result.add(element);
            resultMap[element.id] = true;
          } else if (element.previous != null) {
            Email? previous = element.previous;
            while (previous != null && previous.from != user.email) {
              previous = previous.previous;
            }

            if (previous != null) {
              if (!resultMap.containsKey(previous.id)) {
                result.add(previous);
                resultMap[previous.id] = true;
              }
            }
          }
        }
      }
    });

    return result;
  }

  Map<String, Email> loadAllUserEmails(User user) {
    Map<String, Email> emails = {};

    this.emailBox.toMap().forEach((k, v) {
      if (k.toString().endsWith(user.email)) {
        emails[v.id] = v;
      }
    });

    emails.forEach((k, v) {
      if (v.previousID != null && v.previous == null) {
        v.previous = emails[v.previousID];
      }
    });

    return emails;
  }

  List<Email> getOnlyLastResponseEmails(User user, List<Email> emails) {
    Map<String, bool> relationMap = {};
    emails.forEach((element) {
      if (!relationMap.containsKey(element.id)) {
        relationMap[element.id] = false;
      }

      if (element.previous != null) {
        relationMap[element.previous!.id] = true;
      }
    });

    List<Email> result = [];
    emails.forEach((element) {
      if (!relationMap[element.id]!) {
        result.add(element);
      }
    });

    return result;
  }

  @override
  void dispose() {
    this.emailBox.close();
    this.flagsBox.close();
  }
}
