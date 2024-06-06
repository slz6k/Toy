import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy/screen/RecipeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Random Recipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeScreen(),
    );
  }
}