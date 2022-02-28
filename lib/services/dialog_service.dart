import 'package:flutter/material.dart';
import '../constants/ui_helpers.dart';
import '../widgets/dialogs/custom_dialog.dart';

class CustomDialogService {
  void showAlertDialog(context, title, message, actions) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        actions: actions,
        title: Text(title, style: kHomeTitleTextStyle),
        content: Text(message,
            style: kRegularTextStyle, textAlign: TextAlign.center),
      ),
    );
  }
}
