import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/bloc/home/bloc.dart';
import 'package:d_email_flutter_client/bloc/home/event.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:d_email_flutter_client/ui/pages/home/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (_) => HomeBloc(RepositoryProvider.of<EmailRepository>(context))
          ..add(LoadEvent((BlocProvider.of<AuthBloc>(context).state
                  as AuthenticatedUserState)
              .user)),
        child: HomePageScaffold());
  }
}
