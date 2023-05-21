import 'dart:convert';
import 'dart:io';
import 'package:app001/home/model/transaction_model.dart';
import 'package:path_provider/path_provider.dart';

class LocalFilesReadAndWrite {
  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/dataTransaction.txt';

    return filePath;
  }

  Future<void> saveFile(TransactionModel transaction) async {
    Map<String, dynamic> list = {};
    list = transaction.toJson();

    File file = File(await getFilePath());
    file.writeAsString("${list.toString()},",
        mode: FileMode.append, flush: false, encoding: utf8);
  }

  Future<List<TransactionModel>> readFile() async {
    List<TransactionModel>? transactionList = <TransactionModel>[];
    File file = File(await getFilePath());
    bool fileExists = await file.exists();

    if (!fileExists) await file.create();

    String fileContent = await file.readAsString();
    if (fileContent != "") {
      transactionList = TransactionModel.fromJsonList(fileContent);
      transactionList.forEach((p) => print('TransctionList: $p'));
    }

    return transactionList;
  }
}
