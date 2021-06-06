import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/event.dart';
import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DEmailNavigationScaffold extends StatelessWidget {
  DEmailNavigationScaffold(
      {Key? key,
      required this.route,
      required this.body,
      required this.title,
      required this.updateAction})
      : super(key: key);

  final Widget body;
  final String route;
  final String title;
  final Function updateAction;

  final List<MenuItem> _sideBarItems = const [
    MenuItem(
      title: 'Caixa de Entrada',
      route: AppRouter.INBOX_PAGE_ROUTE,
      icon: Icons.email,
    ),
    MenuItem(
      title: 'Enviados',
      route: AppRouter.SENT_PAGE_ROUTE,
      icon: Icons.send,
    ),
    MenuItem(
      title: 'Carteira',
      route: AppRouter.WALLET_PAGE_ROUTE,
      icon: Icons.account_balance_wallet_rounded,
    ),
  ];

  final List<MenuItem> _adminMenuItems = const [
    MenuItem(
      title: 'Atualizar',
      icon: Icons.logout,
      route: '/update',
    ),
    MenuItem(
      title: 'Sair',
      icon: Icons.logout,
      route: '/logout',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(this.title),
        actions: [
          PopupMenuButton<MenuItem>(
            child: const Icon(Icons.account_circle),
            itemBuilder: (context) {
              return _adminMenuItems.map((MenuItem item) {
                return PopupMenuItem<MenuItem>(
                  value: item,
                  child: Row(
                    children: [
                      Icon(item.icon),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: (item) {
              if (item.route == "/logout") {
                BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
              } else if (item.route == "/update") {
                this.updateAction();
              }
            },
          ),
        ],
      ),
      sideBar: SideBar(
        backgroundColor: Color(0xFFEEEEEE),
        activeBackgroundColor: Colors.lightBlue.shade50,
        borderColor: Colors.white10,
        iconColor: Colors.black87,
        activeIconColor: Theme.of(context).primaryColor,
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
        activeTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
        items: _sideBarItems,
        selectedRoute: route,
        onSelected: (item) {
          if (item.route != null && item.route != route) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(item.route!, (route) => false);
          }
        },
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
