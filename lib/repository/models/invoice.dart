import 'package:rechnungstool/repository/models/customer.dart';
import 'package:rechnungstool/repository/models/invoice_item.dart';
import 'package:rechnungstool/repository/models/provider.dart';

class Invoice {
  final String description;
  final String number;
  final DateTime date;
  final Provider provider;
  final Customer customer;
  final List<InvoiceItem> items;

  const Invoice({
    required this.description,
    required this.number,
    required this.date,
    required this.provider,
    required this.customer,
    required this.items,
  });

  @override
  String toString() {
    return 'Invoice(description: $description, number: $number, date: $date, supplier: $provider, customer: $customer, items: $items)';
  }
}
