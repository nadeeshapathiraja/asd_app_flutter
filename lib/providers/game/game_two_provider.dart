import 'package:flutter/material.dart';

class GameTwoProvider extends ChangeNotifier {
  bool tPress = false;
  bool rPress = false;
  bool aPress = false;
  bool iPress = false;
  bool nPress = false;
  double count = 0;

  bool get clickT => tPress;
  bool get clickR => rPress;
  bool get clickA => aPress;
  bool get clickI => iPress;
  bool get clickN => nPress;
  double get clickCount => count;

  void changeT() {
    tPress = true;
    notifyListeners();
  }

  void changeR() {
    if (tPress == true) {
      rPress = true;
    } else {
      count++;
    }
    notifyListeners();
  }

  void changeA() {
    if (rPress == true) {
      aPress = true;
    } else {
      count++;
    }
    notifyListeners();
  }

  void changeI() {
    if (aPress == true) {
      iPress = true;
    } else {
      count++;
    }
    notifyListeners();
  }

  void changeN() {
    if (iPress == true) {
      nPress = true;
    } else {
      count++;
    }
    notifyListeners();
  }
}
