import 'package:flutter/material.dart';

class ModeProvider extends ChangeNotifier {
  //if mode = false -> child mode
  bool _mode = false;

  //Getter for get mode
  bool get getMode => _mode;

  void changeMode(mode) {
    _mode = mode;
  }

  // void changeMode(mode) {
  //   _mode = !_mode;
  // }
}
