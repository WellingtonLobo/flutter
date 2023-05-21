import 'package:app001/home/model/transaction_day_value.dart';
import 'package:app001/home/model/transaction_model.dart';
import 'package:app001/home/shared/local_files_read_and_write.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'home_page_mobx.g.dart';

class HomePageMobx = _HomePageMobx with _$HomePageMobx;

abstract class _HomePageMobx with Store {
  LocalFilesReadAndWrite localStorage = LocalFilesReadAndWrite();

  @observable
  bool isLoading = false;

  @observable
  bool hasData = false;

  @observable
  String? textTransaction = "";

  @observable
  double? valueTransaction = 0;

  @observable
  DateTime? dateTransaction = DateTime.now();

  @observable
  List<TransactionModel> transactionList = <TransactionModel>[];

  @observable
  TransactionModel? auxDeleteTransaction;

  @observable
  int? indexDeleteTransaction;

  Future<void> getData() async {
    transactionList = await localStorage.readFile();
    isLoading = true;
    if (transactionList.isNotEmpty) {
      hasData = true;
    }
    isLoading = false;
  }

  @action
  Future<void> addTransaction() async {
    isLoading = true;

    int id = 1;
    if (transactionList.isNotEmpty) {
      for (var t in transactionList) {
        if (t.id! >= id) {
          id = t.id! + 1;
        }
      }
    }

    TransactionModel transaction = TransactionModel(
      id: id,
      transaction: textTransaction,
      date: dateTransaction,
      value: valueTransaction,
      inactive: false,
    );

    transactionList.add(transaction);
    await localStorage.saveFile(transaction);

    hasData = transactionList.isNotEmpty;

    dateTransaction = DateTime.now();
    textTransaction = "";
    valueTransaction = 0;

    isLoading = false;
  }

  @action
  Future<bool> removeCard(int id, int index) async {
    bool success = true;
    isLoading = true;
    indexDeleteTransaction = index;
    auxDeleteTransaction = transactionList.firstWhere((t) => t.id == id);
    transactionList.removeWhere((t) => t.id == id);

    if (transactionList.isNotEmpty) {
      for (var transaction in transactionList) {
        if (transaction.id == id) {
          success = false;
        }
      }
    }

    if (transactionList.isEmpty) {
      hasData = false;
    }
    isLoading = false;

    return success;
  }

  @action
  Future<void> returnCard() async {
    isLoading = true;
    transactionList.insert(indexDeleteTransaction!, auxDeleteTransaction!);
    isLoading = false;
  }

  List<TransactionDayValue> get groupedTransactions {
    return List<TransactionDayValue>.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        double totalSum = 0.0;

        for (var transaction in transactionList) {
          bool sameDay = transaction.date!.day == weekDay.day;
          bool sameMonth = transaction.date!.month == weekDay.month;
          bool sameYear = transaction.date!.year == weekDay.year;

          if (sameDay && sameMonth && sameYear) {
            totalSum += transaction.value!;
          }
        }

        return TransactionDayValue(
          day: DateFormat.E().format(weekDay)[0],
          value: totalSum,
        );
      },
    ).reversed.toList();
  }

  double get weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) => sum + tr.value!);
  }
}
