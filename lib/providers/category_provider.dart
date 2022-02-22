// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class CategoryProvider extends ChangeNotifier {
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );

    _imageFile = pickedFile!;

    Logger().i(_imageFile.path);
  }

  PickedFile get imageFile => _imageFile;
}
