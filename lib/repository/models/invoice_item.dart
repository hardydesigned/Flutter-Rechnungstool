class InvoiceItem {
  final String description;
  final DateTime date;
  final int hours;
  final double tax;
  final double unitPrice;

  const InvoiceItem({
    required this.description,
    required this.date,
    required this.hours,
    required this.tax,
    required this.unitPrice,
  });
}
