import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/bloc/inbox/bloc.dart';
import 'package:d_email_flutter_client/bloc/inbox/event.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:d_email_flutter_client/ui/pages/inbox/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InboxBloc>(
        create: (_) =>
            InboxBloc(RepositoryProvider.of<EmailRepository>(context))
              ..add(LoadEvent((BlocProvider.of<AuthBloc>(context).state
                      as AuthenticatedUserState)
                  .user)),
        child: InboxPageScaffold());
  }
}
