import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:d_email_flutter_client/ui/pages/write_email/arguments.dart';
import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailCard extends StatelessWidget {
  final Email email;

  const EmailCard({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user =
        (BlocProvider.of<AuthBloc>(context).state as AuthenticatedUserState)
            .user;

    List<ElevatedButton> actions = [];
    actions.add(ElevatedButton(
        onPressed: () {
          onClickReply(context, [email.from]);
        },
        child: Text("Responder")));

    if (this.email.to.length > 1 ||
        (this.email.to.length == 1 && !this.email.to.contains(user.email))) {
      List<String> to = List<String>.from(this.email.to);
      to.remove(user.email);

      actions.add(ElevatedButton(
          onPressed: () {
            onClickReply(context, [email.from, ...to]);
          },
          child: Text("Responder a todos")));
    }

    return Card(
        child: Column(
      children: [
        Text("Assunto: ${email.subject}"),
        Text("De: ${email.from}"),
        Text("Para: ${email.to.join(', ')}"),
        Text("Conteudo: ${email.body}"),
        ...actions,
      ],
    ));
  }

  void onClickReply(BuildContext context, List<String> to) {
    WriteEmailArguments arguments =
        WriteEmailArguments(responseTo: this.email, to: to);

    Navigator.pushNamed(context, AppRouter.WRITE_EMAIL_PAGE_ROUTE,
        arguments: arguments);
  }
}
