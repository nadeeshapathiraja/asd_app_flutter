import 'package:flutter/material.dart';

class GameOneProvider extends ChangeNotifier {
  final bPress = false;
  final iPress = false;
  final rPress = false;
  final dPress = false;

  bool get clickB => bPress;
  bool get clicki => iPress;
  bool get clickr => rPress;
  bool get clickd => dPress;
}
