import 'package:flutter/material.dart';

class GameThreeProvider extends ChangeNotifier {
  bool dPress = false;
  bool oPress = false;
  bool gPress = false;
  double count = 0;

  bool get clickD => dPress;
  bool get clickO => oPress;
  bool get clickG => gPress;
  double get clickCount => count;

  void changeD() {
    dPress = true;
    notifyListeners();
  }

  void changeO() {
    if (dPress == true) {
      oPress = true;
    } else {
      count++;
    }

    notifyListeners();
  }

  void changeG() {
    if (oPress == true) {
      gPress = true;
    } else {
      count++;
    }
    notifyListeners();
  }
}
