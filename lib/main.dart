import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/screens/home_screen.dart';


void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme:const TextTheme(bodyMedium: TextStyle(fontSize: 20,fontFamily: 'gem'))),
      home: const HomeScreen()
    );
  }
}
