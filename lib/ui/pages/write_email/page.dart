import 'package:d_email_flutter_client/bloc/email/write/bloc.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:d_email_flutter_client/ui/pages/write_email/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WriteEmailPage extends StatefulWidget {
  @override
  _WriteEmailPageState createState() => _WriteEmailPageState();
}

class _WriteEmailPageState extends State<WriteEmailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WriteEmailBloc>(
      create: (_) =>
          WriteEmailBloc(RepositoryProvider.of<EmailRepository>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Novo email'),
        ),
        body: WriteEmailForm(),
      ),
    );
  }
}
