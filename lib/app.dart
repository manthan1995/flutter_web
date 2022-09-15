import 'package:flutter/material.dart';
import 'package:test_app/view/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lato Regular'),
      home: const HomeScreen(),
    );
  }
}
