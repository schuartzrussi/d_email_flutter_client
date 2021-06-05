import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/event.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/bloc/home/bloc.dart';
import 'package:d_email_flutter_client/bloc/home/event.dart';
import 'package:d_email_flutter_client/bloc/home/state.dart';
import 'package:d_email_flutter_client/ui/components/d_email_progress_dialog/component.dart';
import 'package:d_email_flutter_client/ui/components/d_email_snackbar/component.dart';
import 'package:d_email_flutter_client/ui/pages/home/list_view.dart';
import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScaffold extends StatefulWidget {
  @override
  _HomePageScaffoldState createState() => _HomePageScaffoldState();
}

class _HomePageScaffoldState extends State<HomePageScaffold> {
  DEmailProgressDialog? _progressDialog;

  @override
  Widget build(BuildContext context) {
    this._progressDialog = DEmailProgressDialog(context);

    return Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          title: Text(
              "Emails - ${(BlocProvider.of<AuthBloc>(context).state as AuthenticatedUserState).user.email}"),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                BlocProvider.of<HomeBloc>(context)
                  ..add(LoadEvent((BlocProvider.of<AuthBloc>(context).state
                          as AuthenticatedUserState)
                      .user));
              },
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.WRITE_EMAIL_PAGE_ROUTE);
          },
          child: new IconTheme(
            data: new IconThemeData(color: Theme.of(context).accentColor),
            child: new Icon(Icons.send),
          ),
        ),
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.loading) {
              this._progressDialog?.show("Carregando emails...");
            } else {
              this._progressDialog?.hide();

              if (state.fetchError != null) {
                DEmailSnackBar.show(context,
                    "Ocorreu um erro inesperado ao carregar os emails.", 5);
              }
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      constraints: BoxConstraints(maxWidth: 500),
                      child: HomeListView(homeState: state)),
                ],
              );
            },
          ),
        ));
  }
}
