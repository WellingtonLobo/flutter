class TransactionModel {
  int? id;
  String? transaction;
  double? value;
  DateTime? date;
  bool? inactive;
  DateTime? deactivationDate;

  TransactionModel({
    required this.id,
    this.transaction = "",
    this.value = 0,
    this.date,
    this.inactive = false,
    this.deactivationDate,
  });

  @override
  String toString() {
    return '{"id": $id, "transaction":"$transaction", "value": $value, "date":"$date", "inactive": $inactive, "deactivationDate":"$deactivationDate"}';
  }
}
