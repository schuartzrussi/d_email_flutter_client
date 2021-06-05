import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/bloc/sent/bloc.dart';
import 'package:d_email_flutter_client/bloc/sent/event.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:d_email_flutter_client/ui/pages/sent/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SentPage extends StatefulWidget {
  @override
  _SentPageState createState() => _SentPageState();
}

class _SentPageState extends State<SentPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SentBloc>(
        create: (_) => SentBloc(RepositoryProvider.of<EmailRepository>(context))
          ..add(LoadEvent((BlocProvider.of<AuthBloc>(context).state
                  as AuthenticatedUserState)
              .user)),
        child: SentPageScaffold());
  }
}
