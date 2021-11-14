import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studi_kasus/login_page.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
