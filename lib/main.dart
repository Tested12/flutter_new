import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_new/lib/Pages/Login.Dart';

void main() {
  //something in splash screen
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home:Login(),
    );
  }
}


