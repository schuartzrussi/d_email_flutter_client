import 'package:d_email_flutter_client/data/wallet/model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoinTransactionsList extends StatelessWidget {
  List<CoinTransaction>? coinTransactions;

  CoinTransactionsList(this.coinTransactions);

  @override
  Widget build(BuildContext context) {
    if (coinTransactions == null || coinTransactions!.length == 0) {
      return Text("Nenhuma transacao encontrada.");
    }

    List<DataRow> rows = [];
    coinTransactions!.forEach((coinTransaction) {
      rows.add(DataRow(cells: [
        DataCell(SelectableText(coinTransaction.amount.toString())),
        DataCell(SelectableText(
            coinTransaction.transactionType == CoinTransactionType.input
                ? "Entrada"
                : "Saida")),
        DataCell(SelectableText(coinTransaction.from)),
        DataCell(SelectableText(coinTransaction.to)),
      ]));
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: DataTable(columns: [
          DataColumn(label: Text('Valor')),
          DataColumn(label: Text('Tipo')),
          DataColumn(label: Text('De')),
          DataColumn(label: Text('Para')),
        ], rows: rows),
      ),
    );

    /*
    return ListView.builder(
      shrinkWrap: true,
      itemCount: coinTransactions!.length,
      itemBuilder: (BuildContext context, int index) {
        var coinTransaction = coinTransactions![index];
        var transactionType =
            coinTransaction.transactionType == CoinTransactionType.input
                ? "Entrada"
                : "Saida";
        return Card(
          child: Column(
            children: [
              Text("De: ${coinTransaction.from}"),
              Text("Para: ${coinTransaction.to}"),
              Text("Valor: ${coinTransaction.amount.toString()}"),
              Text("De: $transactionType")
            ],
          ),
        );
      },
    );
    */
  }
}
