import 'package:app001/home/controller/home_page_mobx.dart';
import 'package:app001/home/resources/home_page_resources_strings.dart';
import 'package:app001/home/view/widget/transaction_chart.dart';
import 'package:app001/home/view/widget/transaction_custom_bottom.dart';
import 'package:app001/home/view/widget/transaction_no_data.dart';
import 'package:app001/home/view/widget/transaction_list.dart';
import 'package:app001/home/view/widget/transaction_show_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageMobx mobx = HomePageMobx();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    mobx.getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> selectDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: mobx.dateTransaction!,
      firstDate: DateTime(2020, 1),
      lastDate: DateTime.now(),
      helpText: HomePageResourcesStrings.selectDate,
    );
    if (newDate != null) {
      mobx.dateTransaction = newDate;
    }
  }

  Future<void> recoverCard() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${mobx.auxDeleteTransaction!.transaction}",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Theme.of(context).backgroundColor),
        ),
        action: SnackBarAction(
          label: HomePageResourcesStrings.undo,
          onPressed: () => mobx.returnCard(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePageResourcesStrings.appBarText),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              Observer(
            builder: (BuildContext context) => !mobx.isLoading
                ? mobx.hasData
                    ? Container(
                        padding: EdgeInsets.only(
                          left: constraints.maxWidth * .02,
                          right: constraints.maxWidth * .02,
                          top: constraints.maxHeight * .03,
                          bottom: constraints.maxHeight * .01,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TransactionChart(
                              mobx: mobx,
                              constraints: constraints,
                            ),
                            SizedBox(height: constraints.maxHeight * .03),
                            TransactionList(
                              symbolCurrency:
                                  HomePageResourcesStrings.symbolCurrency,
                              mobx: mobx,
                              constraints: constraints,
                              function: recoverCard,
                            ),
                          ],
                        ),
                      )
                    : TransactionNoData(
                        msgScreen:
                            HomePageResourcesStrings.noData.toUpperCase(),
                        mobx: mobx,
                        constraints: constraints)
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            TransactionCustomButtom(
          textBtn: HomePageResourcesStrings.bottonAdd.toUpperCase(),
          constraints: constraints,
          mobx: mobx,
          func: () => transactionShowModalBottomSheet(
              context: context,
              constraints: constraints,
              formKey: formKey,
              mobx: mobx,
              selectDate: selectDate),
        ),
      ),
    );
  }
}
