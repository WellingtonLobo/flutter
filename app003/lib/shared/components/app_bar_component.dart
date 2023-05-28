import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? enabledAction;
  final bool? automaticallyImplyLeading;
  final List<Widget>? actions;

  const AppBarComponent(
      {required this.title,
      this.enabledAction = false,
      this.automaticallyImplyLeading = false,
      this.actions,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        centerTitle: true,
        actions: enabledAction! ? actions : [],
        automaticallyImplyLeading: automaticallyImplyLeading!);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
