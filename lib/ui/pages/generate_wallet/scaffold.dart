import 'package:d_email_flutter_client/bloc/generate_wallet/bloc.dart';
import 'package:d_email_flutter_client/bloc/generate_wallet/event.dart';
import 'package:d_email_flutter_client/bloc/generate_wallet/state.dart';
import 'package:d_email_flutter_client/ui/components/d_email_progress_dialog/component.dart';
import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateWalletPageScaffold extends StatefulWidget {
  @override
  _GenerateWalletPageScaffoldState createState() =>
      _GenerateWalletPageScaffoldState();
}

class _GenerateWalletPageScaffoldState
    extends State<GenerateWalletPageScaffold> {
  DEmailProgressDialog? _progressDialog;

  @override
  Widget build(BuildContext context) {
    this._progressDialog = DEmailProgressDialog(context);

    return BlocListener<GenerateWalletBloc, GenerateWalletState>(
      listener: (context, state) {
        if (state.loading) {
          this._progressDialog!.show("Gerando carteira...");
        } else {
          this._progressDialog!.hide();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: BlocBuilder<GenerateWalletBloc, GenerateWalletState>(
            builder: (context, state) {
          String address = "";
          String mnemonic = "";

          if (state.wallet != null) {
            address = state.wallet!.address;
            mnemonic = state.wallet!.mnemonic;
          }

          return Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: Card(
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 155.0,
                            child: Image.asset(
                              "assets/images/logo-furb.gif",
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 45.0),
                          ListTile(
                            leading: Icon(Icons.account_balance_wallet,
                                color: Colors.green),
                            title: Text("Carteira"),
                          ),
                          Divider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                  SelectableText("Endereco: "),
                                  SelectableText(address,
                                      style: new TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                children: [
                                  SelectableText("Mnemonico: "),
                                  SelectableText(mnemonic,
                                      style: new TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      )),
                                ],
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  child: Text("Cadastro"),
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        AppRouter.SIGNUP_PAGE_ROUTE,
                                        (Route<dynamic> route) => false);
                                  }),

                              ElevatedButton(
                                child: Text('Gerar nova'),
                                onPressed: () {
                                  BlocProvider.of<GenerateWalletBloc>(context)
                                      .add(GenerateWalletEvent());
                                },
                              )
                              //_getSubmitButton(context),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );
        }),
      ),
    );
  }
}
