import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rechnungstool/domain/invoice_loader.dart';
import 'package:rechnungstool/domain/invoice_to_pdf.dart';
import 'package:rechnungstool/presentation/homepage/widgets/custom_button_widget.dart';
import 'package:rechnungstool/presentation/homepage/widgets/custom_data_table_widget.dart';
import 'package:rechnungstool/repository/models/invoice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Invoice> invoices = [];
  String? filePath;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text('Rechnungstool',
                style: Theme.of(context).textTheme.labelMedium),
          ),
          body: Padding(
            padding: const EdgeInsets.all(50),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButtonWidget(
                              buttonText: 'Rechnungen laden',
                              callback: () async {
                                filePath = await InvoiceLoader.pickFile();
                                if (filePath != null) {
                                  invoices =
                                      InvoiceLoader.loadFromCsv(filePath!);
                                  setState(() {});
                                }
                              },
                              width: 200,
                              borderReverse: false),
                          CustomButtonWidget(
                              buttonText: 'Rechnungen speichern',
                              callback: () async {
                                String? path =
                                    await FilePicker.platform.saveFile(
                                  fileName: 'Rechnungen.pdf',
                                );
                                if (path != null) {
                                  for (var invoice in invoices) {
                                    await InvoiceToPdf.generate(
                                        invoice,
                                        path.substring(
                                            0, path.lastIndexOf(r'\') + 1));
                                  }
                                }
                              },
                              width: 200,
                              borderReverse: false),
                        ]),
                  ),
                  CustomDataTableWidget(invocies: invoices),
                ],
              ),
            ),
          )),
    );
  }
}
