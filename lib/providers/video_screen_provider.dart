import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreenProvider extends ChangeNotifier {
  TextEditingController _addItem = TextEditingController();
  late YoutubePlayerController _youtubePlayerController;
  late DocumentReference linkRef;
  List<String> videoId = [];
  bool shoItem = false;

  //get Video url from input field
  TextEditingController get getUrl => _addItem;

  List<String> get getVideoId => videoId;

  addItemFunction() async {
    await linkRef.set(
      {
        _addItem.text.toString(): _addItem.text.toString(),
      },
      SetOptions(merge: true),
    );
  }
}
