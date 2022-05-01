import 'package:flutter/material.dart';

class VideoScreenProvider extends ChangeNotifier {
  late String selectedUrl;

  String get url => selectedUrl;
}
