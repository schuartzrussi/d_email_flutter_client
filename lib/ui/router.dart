import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:d_email_flutter_client/data/wallet/repository.dart';
import 'package:d_email_flutter_client/ui/pages/inbox/page.dart';
import 'package:d_email_flutter_client/ui/pages/login/page.dart';
import 'package:d_email_flutter_client/ui/pages/sent/page.dart';
import 'package:d_email_flutter_client/ui/pages/signup/page.dart';
import 'package:d_email_flutter_client/ui/pages/view_email/page.dart';
import 'package:d_email_flutter_client/ui/pages/wallet/page.dart';
import 'package:d_email_flutter_client/ui/pages/write_email/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String LOGIN_PAGE_ROUTE = "/login";
  static const String SIGNUP_PAGE_ROUTE = "/signup";
  static const String WRITE_EMAIL_PAGE_ROUTE = "/write";
  static const String VIEW_EMAIL_PAGE_ROUTE = "/view";
  static const String INBOX_PAGE_ROUTE = "/inbox";
  static const String SENT_PAGE_ROUTE = "/sent";
  static const String WALLET_PAGE_ROUTE = "/wallet";

  final EmailRepository emailRepository;
  final WalletRepository walletRepository;

  AppRouter(this.emailRepository, this.walletRepository);

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_PAGE_ROUTE:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case SIGNUP_PAGE_ROUTE:
        return MaterialPageRoute(builder: (_) => SignupPage());

      case INBOX_PAGE_ROUTE:
        return PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                RepositoryProvider.value(
                    value: this.emailRepository, child: InboxPage()),
            transitionDuration: Duration(seconds: 0));

      case SENT_PAGE_ROUTE:
        return PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                RepositoryProvider.value(
                    value: this.emailRepository, child: SentPage()),
            transitionDuration: Duration(seconds: 0));

      case WRITE_EMAIL_PAGE_ROUTE:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => RepositoryProvider.value(
                value: this.emailRepository, child: WriteEmailPage()));

      case VIEW_EMAIL_PAGE_ROUTE:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ViewEmailPage());

      case WALLET_PAGE_ROUTE:
        return PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                RepositoryProvider.value(
                    value: this.walletRepository, child: WalletPage()),
            transitionDuration: Duration(seconds: 0));

      default:
        return null;
    }
  }

  void dispose() {
    this.emailRepository.dispose();
    this.walletRepository.dispose();
  }
}
