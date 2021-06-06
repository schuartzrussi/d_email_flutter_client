import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:d_email_flutter_client/ui/components/d_email_avatar/component.dart';
import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';

class DEmailListView extends StatelessWidget {
  final List<Email> emails;

  const DEmailListView({Key? key, required this.emails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: this.emails.length,
      itemBuilder: (BuildContext context, int index) {
        return _Card(email: this.emails[index]);
      },
    );
  }
}

class _Card extends StatelessWidget {
  final Email email;

  const _Card({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFEEEEEE),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouter.VIEW_EMAIL_PAGE_ROUTE,
                arguments: this.email,
              );
            },
            leading: DEmailAvatar(emailAddress: email.from),
            title: Text(this.email.subject),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SelectableText("De: ${email.from}"),
              SelectableText("Para: ${email.to.join(', ')}"),
              SelectableText("Enviado em: ${email.getFormattedSendedAt()}"),
            ])),
      ),
    );
  }
}
