import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:flutter/material.dart';

import 'card.dart';

class ViewEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as Email;
    var cards = [EmailCard(email: email)];
    var previousEmail = email.previous;

    while (previousEmail != null) {
      cards.add(EmailCard(email: previousEmail));
      previousEmail = previousEmail.previous;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
                constraints: BoxConstraints(maxWidth: 500, maxHeight: 700),
                child: SingleChildScrollView(child: Column(children: cards))),
          ),
        ),
      ),
    );
  }
}
