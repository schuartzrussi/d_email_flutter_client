import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:d_email_flutter_client/data/user/repository.dart';
import 'package:d_email_flutter_client/data/wallet/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router.dart';

class App extends StatelessWidget {
  final UserRepository userRepository;
  final EmailRepository emailRepository;
  final WalletRepository walletRepository;

  const App(
      {Key? key,
      required this.userRepository,
      required this.emailRepository,
      required this.walletRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: this.userRepository,
        child: Builder(
          builder: (context) {
            return BlocProvider<AuthBloc>(
                create: (_) => AuthBloc(this.userRepository),
                child: AppView(
                    userRepository: this.userRepository,
                    emailRepository: this.emailRepository,
                    walletRepository: this.walletRepository));
          },
        ));
  }
}

class AppView extends StatefulWidget {
  final UserRepository userRepository;
  final EmailRepository emailRepository;
  final WalletRepository walletRepository;

  const AppView(
      {Key? key,
      required this.userRepository,
      required this.emailRepository,
      required this.walletRepository})
      : super(key: key);

  @override
  _AppViewState createState() =>
      _AppViewState(AppRouter(this.emailRepository, this.walletRepository));
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  _AppViewState(this.appRouter);

  NavigatorState? get _navigator => _navigatorKey.currentState;

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRouter.LOGIN_PAGE_ROUTE,
      navigatorKey: _navigatorKey,
      onGenerateRoute: this.appRouter.onGenerateRoute,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xFF0067C0),
          accentColor: Color(0xFFFFFFFF)),
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthenticatedUserState) {
              _navigator?.pushNamedAndRemoveUntil(
                  AppRouter.INBOX_PAGE_ROUTE, (route) => false);
            } else {
              _navigator?.pushNamedAndRemoveUntil(
                  AppRouter.LOGIN_PAGE_ROUTE, (route) => false);
            }
          },
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    this.widget.userRepository.dispose();
    this.widget.emailRepository.dispose();
    this.widget.walletRepository.dispose();
    super.dispose();
  }
}
