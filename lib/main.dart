import 'package:alan/alan.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:d_email_flutter_client/data/user/repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'data/user/model.dart';
import 'ipfs_client/service/ipfs.dart';
import 'ui/app.dart';

void main() async {
  final appDocDir = await getApplicationDocumentsDirectory();

  Hive
    ..init(appDocDir.path)
    ..registerAdapter(UserAdapter());

  final networkInfo = NetworkInfo.fromSingleHost(
    bech32Hrp: 'demail',
    host: 'localhost',
  );

  var ipfs = Ipfs(url: 'http://127.0.0.1:5001');

  Box<User> userBox = await Hive.openBox("user");
  UserRepository userRepository = UserRepository(userBox, networkInfo);
  EmailRepository emailRepository = EmailRepository(networkInfo, ipfs);
  runApp(App(userRepository: userRepository, emailRepository: emailRepository));
}
