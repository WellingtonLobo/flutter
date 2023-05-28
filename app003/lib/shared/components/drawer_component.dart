import 'package:app003/shared/components/app_bar_component.dart';
import 'package:app003/shared/resources/componets_resources_strings.dart';
import 'package:app003/utils/app_routes.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBarComponent(
            title: ComponentsResourcesSttings.appBarTitleDrawer,
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: Text(ComponentsResourcesSttings.textStore),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: Text(ComponentsResourcesSttings.textOrder),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.orders),
          ),
        ],
      ),
    );
  }
}
