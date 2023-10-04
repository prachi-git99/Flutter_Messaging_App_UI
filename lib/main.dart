import 'package:flutter/material.dart';
import 'package:chatting/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat app UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xffFEEAD1),
          primary: Colors.red// Your accent color
        ),
      ),
      home: HomeScreen(),
    );
  }
}