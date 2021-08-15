import 'package:flutter/material.dart';
import 'package:flutter_tube_temp/models/video.dart';

class VideoTile extends StatelessWidget {
  final Video video;
  String notFoundUrl =
      'https://cdn.neemo.com.br/uploads/settings_webdelivery/logo/3136/image-not-found.jpg';

  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              video.thumb ?? notFoundUrl,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,8,8,0),
                      child: Text(video.title ?? 'title not found', style: TextStyle(fontSize: 16),maxLines: 2,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,2,8,0),
                      child: Text(video.channel ?? 'channel name not found', style: TextStyle(fontSize: 12),),
                    )
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.star_border),
                color: Colors.white,
                iconSize: 30,
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }
}
