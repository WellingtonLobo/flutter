import 'package:app002/utils/app_routers.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  Widget createItemMenu(
      {required IconData icon, required String text, required Function onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        text,
        style: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: () => onTap(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            color: Theme.of(context).primaryColor,
            child: const Text(
              "Let's Cook",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),
          createItemMenu(
              icon: Icons.restaurant,
              text: "Refeições",
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(AppRouters.home)),
          createItemMenu(
              icon: Icons.settings,
              text: "Configurações",
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(AppRouters.settings)),
        ],
      ),
    );
  }
}
