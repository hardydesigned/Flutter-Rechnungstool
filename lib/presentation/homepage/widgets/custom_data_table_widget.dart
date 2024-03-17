import 'package:flutter/material.dart';
import 'package:rechnungstool/repository/models/invoice.dart';

class CustomDataTableWidget extends StatelessWidget {
  final List<Invoice>? invocies;

  const CustomDataTableWidget({super.key, this.invocies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Beschreibung')),
          DataColumn(label: Text('Nummer')),
          DataColumn(label: Text('Datum')),
          DataColumn(label: Text('Anwalt')),
          DataColumn(label: Text('Anwalt-Adresse')),
          DataColumn(label: Text('Anwalt-Bezahladresse')),
          DataColumn(label: Text('Kundenname')),
          DataColumn(label: Text('Kundenadresse')),
          DataColumn(label: Text('1. Dienstleistung')),
          DataColumn(label: Text('Datum')),
          DataColumn(label: Text('Stunden')),
          DataColumn(label: Text('Steuer')),
          DataColumn(label: Text('Preis')),
        ],
        rows: buildRows(),
      ),
    );
  }

  List<DataRow> buildRows() {
    List<DataRow> rows = [];
    for (int i = 0; i < invocies!.length; i++) {
      rows.add(
        DataRow(cells: [
          DataCell(Text(invocies![i].description)),
          DataCell(Text(invocies![i].number)),
          DataCell(Text(invocies![i].date.toString())),
          DataCell(Text(invocies![i].provider.name)),
          DataCell(Text(invocies![i].provider.address)),
          DataCell(Text(invocies![i].provider.paymentInfo)),
          DataCell(Text(invocies![i].customer.name)),
          DataCell(Text(invocies![i].customer.address)),
          DataCell(Text(invocies![i].items[0].description)),
          DataCell(Text(invocies![i].items[0].date.toString())),
          DataCell(Text(invocies![i].items[0].hours.toString())),
          DataCell(Text(invocies![i].items[0].tax.toString())),
          DataCell(Text(invocies![i].items[0].unitPrice.toString())),
        ]),
      );
    }

    return rows;
  }
}
