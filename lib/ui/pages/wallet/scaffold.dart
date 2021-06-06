import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/bloc/wallet/bloc.dart';
import 'package:d_email_flutter_client/bloc/wallet/event.dart';
import 'package:d_email_flutter_client/bloc/wallet/state.dart';
import 'package:d_email_flutter_client/data/wallet/model.dart';
import 'package:d_email_flutter_client/ui/components/d_email_navigation_scaffold/component.dart';
import 'package:d_email_flutter_client/ui/components/d_email_progress_dialog/component.dart';
import 'package:d_email_flutter_client/ui/components/d_email_snackbar/component.dart';
import 'package:d_email_flutter_client/ui/pages/wallet/coin_transactions_list.dart';
import 'package:d_email_flutter_client/ui/pages/wallet/form.dart';
import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPageScaffold extends StatefulWidget {
  @override
  _WalletPageScaffoldState createState() => _WalletPageScaffoldState();
}

class _WalletPageScaffoldState extends State<WalletPageScaffold> {
  DEmailProgressDialog? _progressDialog;

  @override
  Widget build(BuildContext context) {
    this._progressDialog = DEmailProgressDialog(context);

    return DEmailNavigationScaffold(
      route: AppRouter.WALLET_PAGE_ROUTE,
      title: "Carteira",
      updateAction: () {
        BlocProvider.of<WalletBloc>(context)
          ..add(LoadEvent((BlocProvider.of<AuthBloc>(context).state
                  as AuthenticatedUserState)
              .user));
      },
      body: BlocListener<WalletBloc, WalletState>(
        listener: (context, state) {
          if (state.loading) {
            this._progressDialog?.show("Carregando carteira...");
          } else {
            this._progressDialog?.hide();

            if (state.error != null) {
              DEmailSnackBar.show(context, "Ocorreu um erro inesperado", 5);
            } else if (state.sendSuccess) {
              DEmailSnackBar.show(
                  context, "Transferencia realizada com sucesso", 3);

              BlocProvider.of<WalletBloc>(context)
                ..add(LoadEvent((BlocProvider.of<AuthBloc>(context).state
                        as AuthenticatedUserState)
                    .user));
            }
          }
        },
        child: BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            int totalBalance = 0;
            if (state.balance != null) {
              totalBalance = state.balance!;
            }

            return Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Card(
                    color: Color(0xFFEEEEEE),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.attach_money_outlined,
                                  color: Colors.green),
                              title: Text("Total: $totalBalance"),
                            ),
                            Divider(),
                            SendCoinForm(totalBalance: totalBalance),
                            Divider(),
                            CoinTransactionsList(state.coinTransactions)
                          ],
                        )),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
