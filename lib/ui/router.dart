import 'package:d_email_flutter_client/ui/pages/login/page.dart';
import 'package:d_email_flutter_client/ui/pages/signup/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home/page.dart';

class AppRouter {
  static const String LOGIN_PAGE_ROUTE = "/login";
  static const String SIGNUP_PAGE_ROUTE = "/signup";
  static const String HOME_PAGE_ROUTE = "/home";

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_PAGE_ROUTE:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case SIGNUP_PAGE_ROUTE:
        return MaterialPageRoute(builder: (_) => SignupPage());

      case HOME_PAGE_ROUTE:
        return MaterialPageRoute(builder: (_) => HomePage());

      default:
        return null;
    }
  }

  void dispose() {}
}
