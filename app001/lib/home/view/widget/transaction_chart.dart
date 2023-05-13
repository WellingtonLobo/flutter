import 'package:app001/home/controller/home_page_mobx.dart';
import 'package:app001/home/resources/home_page_resources_strings.dart';
import 'package:app001/home/resources/home_page_resources_styles.dart';
import 'package:flutter/material.dart';

class TransactionChart extends StatelessWidget {
  final HomePageMobx mobx;
  final BoxConstraints constraints;

  const TransactionChart(
      {required this.mobx, required this.constraints, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: constraints.maxHeight * .015),
            Text(
              "${HomePageResourcesStrings.amountSpent}: ${HomePageResourcesStrings.symbolCurrency} ${mobx.weekTotalValue.toStringAsFixed(2).replaceAll(".", ",")}",
              style: HomePageResourcesStyles.chartAmountTextStyle,
            ),
            SizedBox(height: constraints.maxHeight * .015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: mobx.groupedTransactions.map((tr) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: chartBar(
                    context: context,
                    label: tr.day!,
                    value: tr.value!,
                    percentage: mobx.weekTotalValue == 0
                        ? 0
                        : tr.value! / mobx.weekTotalValue,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget chartBar({
    required BuildContext context,
    required String label,
    required double value,
    required double percentage,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text(value.toStringAsFixed(2)),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 150,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: HomePageResourcesStyles.bgChartBarDecoration,
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: HomePageResourcesStyles.colorChartValueDecoration,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
