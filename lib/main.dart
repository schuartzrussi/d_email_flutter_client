import 'package:alan/alan.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:d_email_flutter_client/data/user/repository.dart';
import 'package:d_email_flutter_client/data/wallet/repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'data/email/model.dart';
import 'data/user/model.dart';
import 'ipfs_client/service/ipfs.dart';
import 'ui/app.dart';

void main() async {
  final appDocDir = await getApplicationDocumentsDirectory();

  Hive
    ..init(appDocDir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(EmailAdapter());

  final networkInfo = NetworkInfo.fromSingleHost(
    bech32Hrp: 'demail',
    host: 'localhost',
  );

  var ipfs = Ipfs(url: 'http://127.0.0.1:5001');

  Box<User> userBox = await Hive.openBox("user");
  Box<Email> emailBox = await Hive.openBox("email");
  Box<String> flagsBox = await Hive.openBox("flags");

  UserRepository userRepository = UserRepository(userBox, networkInfo);
  EmailRepository emailRepository =
      EmailRepository(networkInfo, ipfs, emailBox, flagsBox);
  WalletRepository walletRepository = WalletRepository(networkInfo);

  runApp(App(
      userRepository: userRepository,
      emailRepository: emailRepository,
      walletRepository: walletRepository));
}
