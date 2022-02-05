class Constants {
  //assets path
  static const imagePath = 'assets/images/';
  static const iconPath = 'assets/icons/';
  static const audioPath = 'assets/audios/';

  //Image assets functions
  static String imageAssets(img) => '$imagePath$img';
  //icon assets Function
  static String iconAssets(icon) => '$iconPath$icon';
  //audio assets Function
  static String audioAssets(audio) => '$audioPath$audio';
}
