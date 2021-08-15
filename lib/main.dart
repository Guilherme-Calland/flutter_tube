import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tube_temp/screens/home.dart';

import 'api.dart';
import 'blocs/videos.bloc.dart';

void main(){
  Api api = Api();
  api.search('minecraft');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => VideosBloc())
      ],
      dependencies: [],
      child: MaterialApp(
        title: 'FlutterTube',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black87,
          backgroundColor: Colors.black87,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.white
            )
          )
        ),
        home: Home()
      ),
    );
  }
}
