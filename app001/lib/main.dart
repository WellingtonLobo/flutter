import 'package:app001/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Personal Expenses",
    theme: ThemeData(
      fontFamily: "Montserrat",
      primaryColor: Colors.indigo,
      appBarTheme: const AppBarTheme(
        color: Colors.indigo,
        centerTitle: true,
      ),
    ),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
    home: const HomePage(),
  ));
}
