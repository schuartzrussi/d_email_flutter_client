import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/bloc/inbox/bloc.dart';
import 'package:d_email_flutter_client/bloc/inbox/event.dart';
import 'package:d_email_flutter_client/bloc/inbox/state.dart';
import 'package:d_email_flutter_client/ui/components/d_email_list_view/component.dart';
import 'package:d_email_flutter_client/ui/components/d_email_navigation_scaffold/component.dart';
import 'package:d_email_flutter_client/ui/components/d_email_progress_dialog/component.dart';
import 'package:d_email_flutter_client/ui/components/d_email_snackbar/component.dart';
import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxPageScaffold extends StatefulWidget {
  @override
  _InboxPageScaffoldState createState() => _InboxPageScaffoldState();
}

class _InboxPageScaffoldState extends State<InboxPageScaffold> {
  DEmailProgressDialog? _progressDialog;

  @override
  Widget build(BuildContext context) {
    this._progressDialog = DEmailProgressDialog(context);

    return Stack(
      children: [
        DEmailNavigationScaffold(
          route: AppRouter.INBOX_PAGE_ROUTE,
          title: "Caixa de Entrada",
          updateAction: () {
            BlocProvider.of<InboxBloc>(context)
              ..add(LoadEvent((BlocProvider.of<AuthBloc>(context).state
                      as AuthenticatedUserState)
                  .user));
          },
          body: BlocListener<InboxBloc, InboxState>(
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
            child: BlocBuilder<InboxBloc, InboxState>(
              builder: (context, state) {
                if (state.emails == null || state.emails!.isEmpty) {
                  return Center(child: Text("Nenhum email recebido."));
                }

                return Center(
                  child: SingleChildScrollView(
                    child: Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: DEmailListView(emails: state.emails!)),
                  ),
                );
              },
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.send),
                foregroundColor: Colors.white,
                onPressed: () {},
              ),
            )),
      ],
    );
  }
}
