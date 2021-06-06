import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/bloc/wallet/bloc.dart';
import 'package:d_email_flutter_client/bloc/wallet/event.dart';
import 'package:d_email_flutter_client/data/wallet/repository.dart';
import 'package:d_email_flutter_client/ui/pages/wallet/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WalletBloc>(
        create: (_) =>
            WalletBloc(RepositoryProvider.of<WalletRepository>(context))
              ..add(LoadEvent((BlocProvider.of<AuthBloc>(context).state
                      as AuthenticatedUserState)
                  .user)),
        child: WalletPageScaffold());
  }
}
