import 'dart:convert';
import 'dart:io';
import 'package:app001/home/model/transaction_model.dart';
import 'package:flutter/services.dart';
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

  Future<bool> saveFileList(List<TransactionModel> transactionList) async {
    File file = File(await getFilePath());
    bool seccess = false;
    try {
      file.writeAsStringSync(TransactionModel.encodeJson(transactionList));
      seccess = true;
      return seccess;
    } catch (err) {
      print(err);
      return seccess;
    }
  }

  Future<List<TransactionModel>> readFile() async {
    List<TransactionModel>? transactionList = <TransactionModel>[];
    File file = File(await getFilePath());
    bool fileExists = await file.exists();

    if (!fileExists) await file.create();

    String fileContent = await file.readAsString();
    if (fileContent != "") {
      var fileSlipt =
          fileContent.replaceAll("[", "").replaceAll("]", "").split("},");

      for (var element in fileSlipt) {
        if (element[element.trim().length - 1] != '}') {
          element = element.trim() + "}";
        }
        transactionList.add(TransactionModel.fromJson(json.decode(element)));
      }

      for (var p in transactionList) {
        print('TransctionList: $p');
      }
    }

    return transactionList;
  }
}
