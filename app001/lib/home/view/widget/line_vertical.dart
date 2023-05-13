import 'package:flutter/material.dart';

class LineVertical extends StatelessWidget {
  final BoxConstraints constraints;

  const LineVertical({required this.constraints, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: constraints.maxWidth * .001,
          left: constraints.maxWidth * .001,
          top: constraints.maxHeight * .065,
          bottom: 0),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
