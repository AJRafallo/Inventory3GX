import 'package:_3gx_application/screens/Adrey/loginpage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),

      debugShowCheckedModeBanner: false,
      home:  LoginPage(),
    );
  }
}