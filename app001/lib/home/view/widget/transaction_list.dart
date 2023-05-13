import 'package:app001/home/controller/home_page_mobx.dart';
import 'package:app001/home/view/widget/transaction_card.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final HomePageMobx mobx;
  final BoxConstraints constraints;
  final String symbolCurrency;
  final void Function() function;

  const TransactionList(
      {required this.symbolCurrency,
      required this.mobx,
      required this.constraints,
      required this.function,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: mobx.transactionList.length,
        itemBuilder: (BuildContext context, int index) {
          var transaction = mobx.transactionList[index];

          return Dismissible(
            key: ValueKey<int>(transaction.id!),
            background: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * .015),
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * .015,
                    vertical: constraints.maxHeight * .01),
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.delete, color: Colors.white, size: 35)
                  ],
                )),
            direction: DismissDirection.endToStart,
            confirmDismiss: (DismissDirection direction) async {
              bool response = await mobx.removeCard(transaction.id!, index);
              if (response) {
                function();
              }
              return response;
            },
            child: TransactionCard(
              symbol: symbolCurrency,
              value: transaction.value!,
              transaction: transaction.transaction!,
              date: transaction.date!,
              constraints: constraints,
            ),
          );
        },
      ),
    );
  }
}
