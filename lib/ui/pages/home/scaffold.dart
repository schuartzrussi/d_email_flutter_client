import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';

class HomePageScaffold extends StatefulWidget {
  @override
  _HomePageScaffoldState createState() => _HomePageScaffoldState();
}

class _HomePageScaffoldState extends State<HomePageScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emails'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.WRITE_EMAIL_PAGE_ROUTE);
        },
        child: new IconTheme(
          data: new IconThemeData(color: Theme.of(context).accentColor),
          child: new Icon(Icons.send),
        ),
      ),
      body: Text("Home"),
    );
  }
}
