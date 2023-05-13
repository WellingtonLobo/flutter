import 'package:app001/home/view/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
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
