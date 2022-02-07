import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class DialogBox {
  Future<void> dialogbox(
    BuildContext context,
    DialogType type,
    String title,
    String desc,
    Function() onTap,
  ) async {
    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: desc,
      btnOkOnPress: onTap,
    )..show();
  }
}
