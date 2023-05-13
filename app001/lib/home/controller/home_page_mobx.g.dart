// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageMobx on _HomePageMobx, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomePageMobx.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasDataAtom =
      Atom(name: '_HomePageMobx.hasData', context: context);

  @override
  bool get hasData {
    _$hasDataAtom.reportRead();
    return super.hasData;
  }

  @override
  set hasData(bool value) {
    _$hasDataAtom.reportWrite(value, super.hasData, () {
      super.hasData = value;
    });
  }

  late final _$textTransactionAtom =
      Atom(name: '_HomePageMobx.textTransaction', context: context);

  @override
  String? get textTransaction {
    _$textTransactionAtom.reportRead();
    return super.textTransaction;
  }

  @override
  set textTransaction(String? value) {
    _$textTransactionAtom.reportWrite(value, super.textTransaction, () {
      super.textTransaction = value;
    });
  }

  late final _$valueTransactionAtom =
      Atom(name: '_HomePageMobx.valueTransaction', context: context);

  @override
  double? get valueTransaction {
    _$valueTransactionAtom.reportRead();
    return super.valueTransaction;
  }

  @override
  set valueTransaction(double? value) {
    _$valueTransactionAtom.reportWrite(value, super.valueTransaction, () {
      super.valueTransaction = value;
    });
  }

  late final _$dateTransactionAtom =
      Atom(name: '_HomePageMobx.dateTransaction', context: context);

  @override
  DateTime? get dateTransaction {
    _$dateTransactionAtom.reportRead();
    return super.dateTransaction;
  }

  @override
  set dateTransaction(DateTime? value) {
    _$dateTransactionAtom.reportWrite(value, super.dateTransaction, () {
      super.dateTransaction = value;
    });
  }

  late final _$transactionListAtom =
      Atom(name: '_HomePageMobx.transactionList', context: context);

  @override
  List<TransactionModel> get transactionList {
    _$transactionListAtom.reportRead();
    return super.transactionList;
  }

  @override
  set transactionList(List<TransactionModel> value) {
    _$transactionListAtom.reportWrite(value, super.transactionList, () {
      super.transactionList = value;
    });
  }

  late final _$auxDeleteTransactionAtom =
      Atom(name: '_HomePageMobx.auxDeleteTransaction', context: context);

  @override
  TransactionModel? get auxDeleteTransaction {
    _$auxDeleteTransactionAtom.reportRead();
    return super.auxDeleteTransaction;
  }

  @override
  set auxDeleteTransaction(TransactionModel? value) {
    _$auxDeleteTransactionAtom.reportWrite(value, super.auxDeleteTransaction,
        () {
      super.auxDeleteTransaction = value;
    });
  }

  late final _$indexDeleteTransactionAtom =
      Atom(name: '_HomePageMobx.indexDeleteTransaction', context: context);

  @override
  int? get indexDeleteTransaction {
    _$indexDeleteTransactionAtom.reportRead();
    return super.indexDeleteTransaction;
  }

  @override
  set indexDeleteTransaction(int? value) {
    _$indexDeleteTransactionAtom
        .reportWrite(value, super.indexDeleteTransaction, () {
      super.indexDeleteTransaction = value;
    });
  }

  late final _$addTransactionAsyncAction =
      AsyncAction('_HomePageMobx.addTransaction', context: context);

  @override
  Future<void> addTransaction() {
    return _$addTransactionAsyncAction.run(() => super.addTransaction());
  }

  late final _$removeCardAsyncAction =
      AsyncAction('_HomePageMobx.removeCard', context: context);

  @override
  Future<bool> removeCard(int id, int index) {
    return _$removeCardAsyncAction.run(() => super.removeCard(id, index));
  }

  late final _$returnCardAsyncAction =
      AsyncAction('_HomePageMobx.returnCard', context: context);

  @override
  Future<void> returnCard() {
    return _$returnCardAsyncAction.run(() => super.returnCard());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasData: ${hasData},
textTransaction: ${textTransaction},
valueTransaction: ${valueTransaction},
dateTransaction: ${dateTransaction},
transactionList: ${transactionList},
auxDeleteTransaction: ${auxDeleteTransaction},
indexDeleteTransaction: ${indexDeleteTransaction}
    ''';
  }
}
