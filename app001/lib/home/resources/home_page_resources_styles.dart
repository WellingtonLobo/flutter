import 'package:flutter/material.dart';

class HomePageResourcesStyles {
  //******************BOX DECORATION********************//
  static BoxDecoration sheetContainerDecoration = BoxDecoration(
    color: Colors.grey.shade100,
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(30),
      topLeft: Radius.circular(30),
    ),
  );

  static BoxDecoration bgChartBarDecoration = BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
    color: const Color.fromRGBO(220, 220, 220, 1),
    borderRadius: BorderRadius.circular(5),
  );

  static BoxDecoration colorChartValueDecoration = BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.circular(5),
  );

  //*******************TEXT STYLE***********************//
  static const TextStyle noDataStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    letterSpacing: .5,
    shadows: [
      Shadow(
        color: Colors.grey,
        blurRadius: 1,
        offset: Offset(.5, 1),
      )
    ],
  );

  static const TextStyle addButtonStyle = TextStyle(
    color: Colors.white,
  );

  static const TextStyle symbloCurrencyStyle = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle valueTransactionStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22,
  );

  static const TextStyle transactionStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle dateTransactionStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );

  static const TextStyle noDataTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: .5);

  static const TextStyle chartAmountTextStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
