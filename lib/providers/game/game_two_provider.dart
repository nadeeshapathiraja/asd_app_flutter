import 'package:flutter/material.dart';

class GameTwoProvider extends ChangeNotifier {
  bool tPress = false;
  bool rPress = false;
  bool aPress = false;
  bool iPress = false;
  bool nPress = false;

  bool get clickT => tPress;
  bool get clickR => rPress;
  bool get clickA => aPress;
  bool get clickI => iPress;
  bool get clickN => nPress;

  void changeT() {
    tPress = true;
    notifyListeners();
  }

  void changeR() {
    if (tPress == true) {
      rPress = true;
    }
    notifyListeners();
  }

  void changeA() {
    if (rPress == true) {
      aPress = true;
    }
    notifyListeners();
  }

  void changeI() {
    if (aPress == true) {
      iPress = true;
    }
    notifyListeners();
  }

  void changeN() {
    if (iPress == true) {
      nPress = true;
    }
    notifyListeners();
  }
}
