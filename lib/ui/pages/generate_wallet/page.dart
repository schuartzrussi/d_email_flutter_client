import 'package:d_email_flutter_client/bloc/generate_wallet/bloc.dart';
import 'package:d_email_flutter_client/bloc/generate_wallet/event.dart';
import 'package:d_email_flutter_client/data/wallet/repository.dart';
import 'package:d_email_flutter_client/ui/pages/generate_wallet/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateWalletPage extends StatefulWidget {
  @override
  _GenerateWalletPageState createState() => _GenerateWalletPageState();
}

class _GenerateWalletPageState extends State<GenerateWalletPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GenerateWalletBloc>(
        create: (_) =>
            GenerateWalletBloc(RepositoryProvider.of<WalletRepository>(context))
              ..add(GenerateWalletEvent()),
        child: GenerateWalletPageScaffold());
  }
}
