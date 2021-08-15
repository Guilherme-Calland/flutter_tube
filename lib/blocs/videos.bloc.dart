import 'dart:async';
import 'dart:ui';
import 'package:flutter_tube_temp/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_tube_temp/models/video.dart';
import 'dart:async';

class VideosBloc implements BlocBase{

  Api? api;
  List<Video> videos = [];

  final _videosController = StreamController<List<Video>>();
  Stream get outVideos => _videosController.stream;

  final _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  VideosBloc(){
    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(dynamic search) async{
    videos = await api!.search(search);
    _videosController.sink.add(videos);
    print(videos);
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

}