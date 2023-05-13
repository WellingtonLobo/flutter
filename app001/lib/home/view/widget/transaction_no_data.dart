import 'package:app001/home/controller/home_page_mobx.dart';
import 'package:app001/home/resources/home_page_resources_strings.dart';
import 'package:app001/home/resources/home_page_resources_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionNoData extends StatelessWidget {
  final HomePageMobx mobx;
  final BoxConstraints constraints;
  final String msgScreen;

  const TransactionNoData(
      {required this.msgScreen,
      required this.mobx,
      required this.constraints,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: constraints.maxHeight * .03),
        Observer(
          builder: (BuildContext context) => mobx.hasData
              ? const SizedBox()
              : Text(
                  msgScreen,
                  style: HomePageResourcesStyles.noDataStyle,
                ),
        ),
        Expanded(
          child: Center(
            child: Image.asset(
              HomePageResourcesStrings.imageNoData,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
