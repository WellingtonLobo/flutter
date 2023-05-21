import 'package:app002/models/setting_model.dart';
import 'package:app002/screens/components/menu_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final SettingModel settings;
  final Function(SettingModel) onSettingsChange;
  const SettingsScreen(
      {required this.onSettingsChange, required this.settings, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SettingModel settings;

  @override
  void initState() {
    settings = widget.settings;
    super.initState();
  }

  Widget createSwitch(
      {required String title,
      required String subtitle,
      required bool value,
      required Function(bool) onchange}) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (newValue) {
        onchange(newValue);
        widget.onSettingsChange(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Configurações e Filtros",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView(children: [
            createSwitch(
              title: "Sem Glutén",
              subtitle: "Só exibe refeições sem glutén",
              value: settings.isGlutenFree!,
              onchange: (v) => setState(() => settings.isGlutenFree = v),
            ),
            createSwitch(
              title: "Sem Lactose",
              subtitle: "Só exibe refeições sem Lactose",
              value: settings.isLactoseFree!,
              onchange: (v) => setState(() => settings.isLactoseFree = v),
            ),
            createSwitch(
              title: "Sem Veganas",
              subtitle: "Só exibe refeições veganas",
              value: settings.isVegan!,
              onchange: (v) => setState(() => settings.isVegan = v),
            ),
            createSwitch(
              title: "Sem Vegetarianas",
              subtitle: "Só exibe refeições Vegetarianas",
              value: settings.isVegetarian!,
              onchange: (v) => setState(() => settings.isVegetarian = v),
            ),
          ]),
        )
      ]),
      drawer: const MenuDrawer(),
    );
  }
}
