import 'package:flutter/material.dart';
import 'package:flutter_tube_temp/screens/home.dart';

import 'api.dart';

void main(){
  Api api = Api();
  api.search('minecraft');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterTube',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cursorColor: Colors.white,
        scaffoldBackgroundColor: Colors.black87,
        backgroundColor: Colors.black87,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white
          )
        )
      ),
      home: Home()
    );
  }
}
