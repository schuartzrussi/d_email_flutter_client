import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/bloc/sent/bloc.dart';
import 'package:d_email_flutter_client/bloc/sent/event.dart';
import 'package:d_email_flutter_client/ui/components/d_email_navigation_scaffold/component.dart';
import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SentPageScaffold extends StatefulWidget {
  @override
  _SentPageScaffoldState createState() => _SentPageScaffoldState();
}

class _SentPageScaffoldState extends State<SentPageScaffold> {
  @override
  Widget build(BuildContext context) {
    return DEmailNavigationScaffold(
      route: AppRouter.SENT_PAGE_ROUTE,
      title: "Enviados",
      updateAction: () {
        BlocProvider.of<SentBloc>(context)
          ..add(LoadEvent((BlocProvider.of<AuthBloc>(context).state
                  as AuthenticatedUserState)
              .user));
      },
      body: Text("Sent"),
    );
  }
}
