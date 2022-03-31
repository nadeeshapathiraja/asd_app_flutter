import 'package:flutter/material.dart';

class GameThreeProvider extends ChangeNotifier {
  bool dPress = false;
  bool oPress = false;
  bool gPress = false;

  bool get clickD => dPress;
  bool get clickO => oPress;
  bool get clickG => gPress;

  void changeD() {
    dPress = true;
    notifyListeners();
  }

  void changeO() {
    if (dPress == true) {
      oPress = true;
    }
    notifyListeners();
  }

  void changeG() {
    if (oPress == true) {
      gPress = true;
    }
    notifyListeners();
  }
}
