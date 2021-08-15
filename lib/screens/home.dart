import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tube_temp/blocs/videos.bloc.dart';
import 'package:flutter_tube_temp/delegates/data.search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<VideosBloc>();
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Container(
          height: 25,
          child: Image.asset('images/yt_logo_rgb_dark.png'),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text('0'),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
              String? result = await showSearch(context: context, delegate: DataSearch(),);
              if(result != null){
                bloc.inSearch.add(result);
              }
            },
          )
        ],
      ),
    );
  }
}
