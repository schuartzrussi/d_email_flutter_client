import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:d_email_flutter_client/ipfs_client/service/ipfs.dart';
import 'package:d_email_flutter_client/ui/pages/login/page.dart';
import 'package:d_email_flutter_client/ui/pages/signup/page.dart';
import 'package:d_email_flutter_client/ui/pages/view_email/page.dart';
import 'package:d_email_flutter_client/ui/pages/write_email/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home/page.dart';

class AppRouter {
  static const String LOGIN_PAGE_ROUTE = "/login";
  static const String SIGNUP_PAGE_ROUTE = "/signup";
  static const String HOME_PAGE_ROUTE = "/home";
  static const String WRITE_EMAIL_PAGE_ROUTE = "/write";
  static const String VIEW_EMAIL_PAGE_ROUTE = "/view";

  final EmailRepository emailRepository;

  AppRouter(this.emailRepository);

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_PAGE_ROUTE:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case SIGNUP_PAGE_ROUTE:
        return MaterialPageRoute(builder: (_) => SignupPage());

      case HOME_PAGE_ROUTE:
        return MaterialPageRoute(
            builder: (_) => RepositoryProvider.value(
                value: this.emailRepository, child: HomePage()));

      case WRITE_EMAIL_PAGE_ROUTE:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => RepositoryProvider.value(
                value: this.emailRepository, child: WriteEmailPage()));

      case VIEW_EMAIL_PAGE_ROUTE:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ViewEmailPage());

      default:
        return null;
    }
  }

  void dispose() {
    this.emailRepository.dispose();
  }
}
