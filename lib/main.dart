import 'package:flutter/material.dart';
import 'package:flutter_task_skygoal/views/NavBar/NavbarView.dart';
import 'package:flutter_task_skygoal/views/views/home.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: defaultColor),
        useMaterial3: true,
      ),
      home: NavBarPage(
        page: Home(),
      ),
    );
  }
}
