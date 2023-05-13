import 'package:app001/home/resources/home_page_resources_styles.dart';
import 'package:app001/home/view/widget/line_vertical.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final BoxConstraints constraints;
  final String symbol;
  final double value;
  final String transaction;
  final DateTime date;

  const TransactionCard({
    required this.transaction,
    required this.value,
    required this.symbol,
    required this.date,
    required this.constraints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: columnText(
              upperText: symbol,
              upperStyle: HomePageResourcesStyles.symbloCurrencyStyle,
              bottomText: value,
              bottomStyle: HomePageResourcesStyles.valueTransactionStyle,
              isNumber: true,
            ),
          ),
          LineVertical(constraints: constraints),
          Expanded(
            flex: 2,
            child: columnText(
              upperText: transaction,
              upperStyle: HomePageResourcesStyles.transactionStyle,
              bottomText: DateFormat('dd/MM/yyyy hh:mm').format(date),
              bottomStyle: HomePageResourcesStyles.dateTransactionStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget columnText({
    String? upperText = "",
    dynamic bottomText,
    TextStyle? upperStyle,
    TextStyle? bottomStyle,
    bool? isNumber = false,
  }) {
    return Container(
      padding: EdgeInsets.all(constraints.maxHeight * .015),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            upperText!,
            style: upperStyle,
          ),
          Text(
            isNumber!
                ? bottomText.toStringAsFixed(2).replaceAll(".", ",")
                : bottomText,
            style: bottomStyle,
          )
        ],
      ),
    );
  }
}
