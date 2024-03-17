import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:rechnungstool/repository/models/customer.dart';
import 'package:rechnungstool/repository/models/invoice.dart';
import 'package:rechnungstool/repository/models/invoice_item.dart';
import 'package:rechnungstool/repository/models/provider.dart';

class InvoiceLoader {
  static Future<String?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      return file.path!;
    }
    return null;
  }

  static List<Invoice> loadFromCsv(String filePath) {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    final invoices = <Invoice>[];

    for (var line in lines) {
      final fields = line.split(';');
      if (fields[0] == 'Beschreibung') continue; // skip header line

      List<InvoiceItem> itemsList = [];
      for (var i = 8; i < fields.length; i += 5) {
        final item = InvoiceItem(
          description: fields[i],
          date: DateTime(
            int.parse(fields[i + 1].substring(6)),
            int.parse(fields[i + 1].substring(3, 5)),
            int.parse(fields[i + 1].substring(0, 2)),
          ),
          hours: int.parse(fields[i + 2]),
          tax: double.parse(fields[i + 3]),
          unitPrice: double.parse(fields[i + 4]),
        );

        itemsList.add(item);
      }

      final invoice = Invoice(
        description: fields[0],
        number: fields[1],
        date: DateTime(
          int.parse(fields[2].substring(6)),
          int.parse(fields[2].substring(3, 5)),
          int.parse(fields[2].substring(0, 2)),
        ),
        provider: Provider(
          name: fields[3],
          address: fields[4],
          paymentInfo: fields[5],
        ),
        customer: Customer(
          name: fields[6],
          address: fields[7],
        ),
        items: itemsList,
      );

      invoices.add(invoice);
    }

    return invoices;
  }
}
