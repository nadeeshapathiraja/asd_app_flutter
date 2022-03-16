import 'package:flutter/material.dart';

class GameOneProvider extends ChangeNotifier {
  bool bPress = false;
  bool iPress = false;
  bool rPress = false;
  bool dPress = false;

  bool get clickB => bPress;
  bool get clicki => iPress;
  bool get clickr => rPress;
  bool get clickd => dPress;

  void changeB() {
    bPress = true;
    notifyListeners();
  }

  void changeI() {
    if (bPress == true) {
      iPress = true;
      print("i press");
    }
    notifyListeners();
  }

  void changeR() {
    if (bPress == true) {
      if (iPress = true) {
        rPress = true;
        print("r press");
      }
    }
    notifyListeners();
  }

  void changeD() {
    if (bPress == true) {
      if (iPress = true) {
        if (rPress = true) {
          dPress = true;
          print("d press");
        }
      }
    }
    notifyListeners();
  }
}
