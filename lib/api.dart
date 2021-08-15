import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/video.dart';

const API_KEY = "AIzaSyC_GjZGGuvervM19n_mPJWYXw1_9L5-bxc";

class Api{
  search(String search) async{
    http.Response response = await http.get(
      Uri.parse("https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10")
    );

    return decode(response);
  }

  List<Video> decode(http.Response response){
    if(sucessfullResponse(response)){
      var decoded = json.decode(response.body);
      List<Video> videos = decoded['items'].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();
      //print(videos);
      return videos;
    }else{
      print(' unsucessfull response :( ');
      throw Exception('failed to load videos :(');
    }

  }

  bool sucessfullResponse(http.Response response) => response.statusCode == 200;
}

// "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
// "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
// "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"