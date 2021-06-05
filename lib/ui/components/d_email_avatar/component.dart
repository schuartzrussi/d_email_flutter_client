import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DEmailAvatar extends StatelessWidget {
  late String avatarText;

  DEmailAvatar({Key? key, required String emailAddress}) : super(key: key) {
    String address = emailAddress.split("@")[0];
    this.avatarText =
        "${address[0]}${address[address.length - 1]}".toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor,
      child: Text(this.avatarText),
    );
  }
}
