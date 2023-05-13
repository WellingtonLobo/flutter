import 'package:app001/home/controller/home_page_mobx.dart';
import 'package:app001/home/resources/home_page_resources_strings.dart';
import 'package:app001/home/resources/home_page_resources_styles.dart';
import 'package:app001/home/view/widget/transaction_custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

void transactionShowModalBottomSheet({
  required BuildContext context,
  required BoxConstraints constraints,
  required GlobalKey<FormState> formKey,
  required HomePageMobx mobx,
  required void Function() selectDate,
}) {
  showModalBottomSheet(
    isDismissible: false,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Observer(
        builder: (BuildContext context) {
          mobx.dateTransaction;
          return Container(
            decoration: HomePageResourcesStyles.sheetContainerDecoration,
            padding: EdgeInsets.only(
              top: constraints.maxHeight * .025,
              left: constraints.maxWidth * .015,
              right: constraints.maxWidth * .015,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    HomePageResourcesStrings.newTransaction,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 20,
                    indent: 100,
                    endIndent: 100,
                    thickness: 2,
                  ),
                  TextFormField(
                    maxLength: 30,
                    decoration: InputDecoration(
                      labelText: HomePageResourcesStrings.newTransaction,
                      labelStyle: const TextStyle(
                        color: Colors.indigo,
                      ),
                      suffixIcon: mobx.textTransaction != ""
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const Icon(Icons.circle_outlined),
                      enabledBorder: const UnderlineInputBorder(),
                    ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? HomePageResourcesStrings.msgValidaterDescription
                        : null,
                    onChanged: (value) => mobx.textTransaction = value,
                  ),
                  SizedBox(height: constraints.maxHeight * .015),
                  TextFormField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: HomePageResourcesStrings.amountSpent,
                      labelStyle: const TextStyle(
                        color: Colors.indigo,
                      ),
                      suffixIcon: mobx.valueTransaction != 0
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const Icon(Icons.circle_outlined),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? HomePageResourcesStrings.msgValidateAmountSpent
                        : null,
                    onChanged: (value) =>
                        mobx.valueTransaction = double.parse(value),
                  ),
                  SizedBox(height: constraints.maxHeight * .015),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          key: Key(DateFormat('dd/MM/yyyy hh:mm')
                              .format(mobx.dateTransaction!)),
                          initialValue: DateFormat('dd/MM/yyyy hh:mm')
                              .format(mobx.dateTransaction!),
                          decoration: const InputDecoration(
                            labelText: HomePageResourcesStrings.dateTransaction,
                            labelStyle: TextStyle(
                              color: Colors.indigo,
                            ),
                            suffixIcon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          validator: (value) => (value == null || value.isEmpty)
                              ? HomePageResourcesStrings
                                  .msgValidateDateTransaction
                              : null,
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * .025),
                      IconButton(
                        onPressed: selectDate,
                        icon: const Icon(
                          Icons.calendar_month,
                          size: 40,
                          color: Colors.indigo,
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * .025),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * .015),
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) =>
                            TransactionCustomButtom(
                      textBtn:
                          HomePageResourcesStrings.bottonSave.toUpperCase(),
                      constraints: constraints,
                      mobx: mobx,
                      func: () {
                        if (formKey.currentState!.validate()) {
                          mobx.addTransaction();
                          Navigator.pop(context);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
