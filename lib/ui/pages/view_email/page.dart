import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:flutter/material.dart';

class ViewEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as Email;
    print(email.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 500, maxHeight: 700),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("De: ${email.from}"),
                    Text("Para: ${email.to.join(', ')}"),
                    Text(email.body)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
