class Constants {
  //assets path
  static const imagePath = 'assets/images/';
  static const iconPath = 'assets/icons/';
  static const audioPath = 'assets/audios/';
  static const videoPath = 'assets/videos/';
  static const gamePath = 'assets/games/';

  //Image assets functions
  static String imageAssets(img) => '$imagePath$img';

  //icon assets Function
  static String iconAssets(icon) => '$iconPath$icon';

  //audio assets Function
  static String audioAssets(audio) => '$audioPath$audio';

  //video assets Function
  static String videoAssets(video) => '$videoPath$video';

  //game assets functions
  static String gameAssets(game) => '$gamePath$game';
}
