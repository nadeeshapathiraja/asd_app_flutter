import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AudioProvider extends ChangeNotifier {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  AssetsAudioPlayer get getAudioPlayer => audioPlayer;

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  playMusic() async {
    await audioPlayer.play();
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  void setupPlayList() async {
    audioPlayer.open(
      Playlist(
        audios: [
          Audio.network(
            'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3',
          ),
        ],
      ),
      showNotification: true,
      autoStart: false,
    );
  }
}
