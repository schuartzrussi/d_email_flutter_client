import 'package:d_email_flutter_client/bloc/home/state.dart';
import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:flutter/material.dart';

class HomeListView extends StatelessWidget {
  final HomeState homeState;

  const HomeListView({Key? key, required this.homeState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.homeState.fetchError != null && this.homeState.fetchError != "") {
      return Center(child: Text(this.homeState.fetchError!));
    }

    if (this.homeState.emails == null || this.homeState.emails!.isEmpty) {
      return Center(child: Text("Nenhum email encontrado."));
    }

    return ListView.builder(
      itemCount: this.homeState.emails!.length,
      itemBuilder: (BuildContext context, int index) {
        return _EmailCard(email: this.homeState.emails![index]);
      },
    );
  }
}

class _EmailCard extends StatelessWidget {
  final Email email;

  const _EmailCard({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(this.email.subject),
            subtitle: Text(this.email.from +
                " - Enviado em " +
                this.email.getFormattedSendedAt()),
          )
        ],
      ),
    );
  }
}
