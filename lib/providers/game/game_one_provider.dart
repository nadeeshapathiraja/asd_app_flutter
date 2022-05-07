import 'package:flutter/material.dart';

class GameOneProvider extends ChangeNotifier {
  bool bPress = false;
  bool iPress = false;
  bool rPress = false;
  bool dPress = false;
  double count = 0;

  bool get clickB => bPress;
  bool get clicki => iPress;
  bool get clickr => rPress;
  bool get clickd => dPress;
  double get clickCount => count;

  void changeB() {
    bPress = true;
    notifyListeners();
  }

  void changeI() {
    if (bPress == true) {
      iPress = true;
      print("i press");
    } else {
      count++;
    }
    notifyListeners();
  }

  void changeR() {
    if (iPress == true) {
      rPress = true;
      print("r press");
    } else {
      count++;
    }
    notifyListeners();
  }

  void changeD() {
    if (rPress == true) {
      dPress = true;
      print("d press");
    } else {
      count++;
    }

    notifyListeners();
  }
}
