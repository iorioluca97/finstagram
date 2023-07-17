import 'package:finstagram/pages/LoginPage.dart';
import 'package:finstagram/pages/RegisterPage.dart';
import 'package:flutter/material.dart';

import 'pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ROUTES
      initialRoute: 'login',
      routes: {
        "home": (context) => HomePage(),
        "login": (context) => LoginPage(),
        "register": (context) => RegisterPage(),
      },
      title: "Finstagram",
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(body: HomePage()),
    );
  }
}
