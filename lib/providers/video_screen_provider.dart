import 'package:flutter/material.dart';

class VideoScreenProvider extends ChangeNotifier {
  List<Map<String, Object>> _videoList = [
    {
      'id': "2",
      'name': "Elephant Dream",
      'videoUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      'thumbnailUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
    },
    {
      'id': "3",
      'name': "Big Buck Bunny",
      'videoUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      'thumbnailUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
    },
    {
      'id': "4",
      'name': "For Bigger Blazes",
      'videoUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      'thumbnailUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg",
    },
    {
      'id': "5",
      'name': "For Bigger Escape",
      'videoUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
      'thumbnailUrl':
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg",
    }
  ];

  List get getVideoList => _videoList;
}
