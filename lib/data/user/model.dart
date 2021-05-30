import 'package:equatable/equatable.dart';

import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class User extends Equatable {
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String password;

  @HiveField(2)
  final String mnemonic;

  @HiveField(3)
  final String rsaPublicKey;

  @HiveField(4)
  final String rsaPrivateKey;

  @HiveField(5)
  final int trackID;

  User(this.email, this.password, this.mnemonic, this.rsaPublicKey,
      this.rsaPrivateKey, this.trackID);

  @override
  List<Object> get props => [
        this.email,
        this.password,
        this.mnemonic,
        this.rsaPublicKey,
        this.rsaPrivateKey,
        this.trackID
      ];
}
