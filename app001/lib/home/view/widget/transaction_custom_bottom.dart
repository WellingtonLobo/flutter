import 'package:app001/home/controller/home_page_mobx.dart';
import 'package:app001/home/resources/home_page_resources_styles.dart';
import 'package:flutter/material.dart';

class TransactionCustomButtom extends StatelessWidget {
  final String? textBtn;
  final HomePageMobx? mobx;
  final BoxConstraints? constraints;
  final void Function()? func;

  const TransactionCustomButtom(
      {this.textBtn, this.mobx, this.func, this.constraints, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: constraints!.maxWidth * .01),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          fixedSize: Size(constraints!.maxWidth, constraints!.maxHeight * .05),
          backgroundColor: Colors.indigo,
        ),
        onPressed: () {
          func!();
        },
        child: Text(
          textBtn!,
          style: HomePageResourcesStyles.addButtonStyle,
        ),
      ),
    );
  }
}
