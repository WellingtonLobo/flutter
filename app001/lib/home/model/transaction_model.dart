import 'dart:convert';

class TransactionModel {
  int? id;
  String? transaction;
  double? value;
  DateTime? date;
  bool? inactive;

  TransactionModel({
    required this.id,
    this.transaction = "",
    this.value = 0,
    this.date,
    this.inactive = false,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    transaction = json["transaction"];
    value = json["value"];
    date = DateTime.parse(json["date"]);
    inactive = json["inactive"];
  }

  static List<TransactionModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TransactionModel.fromJson(map)).toList();
  }

  static List<TransactionModel> fromJsonList(dynamic jsonResponse) {
    List<TransactionModel> result = <TransactionModel>[];
    jsonResponse.forEach((item) => result.add(TransactionModel.fromJson(item)));
    return result;
  }

  static String encodeJson(List<TransactionModel> transactionList) =>
      json.encode(
        transactionList.map<Map<String, dynamic>>((t) => t.toJson()).toList(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["transaction"] = transaction;
    data["value"] = value;
    data["date"] = date.toString();
    data["inactive"] = inactive;

    return data;
  }

  @override
  String toString() {
    return '{"id": $id, "transaction":"$transaction", "value": $value, "date":"$date", "inactive": $inactive}';
  }
}
