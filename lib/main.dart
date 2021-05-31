import 'package:alan/alan.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:d_email_flutter_client/data/user/repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'data/user/model.dart';
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

  Box<User> userBox = await Hive.openBox("user");
  UserRepository userRepository = UserRepository(userBox, networkInfo);
  EmailRepository emailRepository = EmailRepository(networkInfo);
  runApp(App(userRepository: userRepository, emailRepository: emailRepository));
}
