import 'dart:io';
import 'package:pdf/widgets.dart';

class PdfSaver {
  static Future saveDocument({
    required String path,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final file = File(path);

    await file.writeAsBytes(bytes);
  }
}
