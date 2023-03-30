import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void showAlert(
    BuildContext context, String text, QuickAlertType quickAlertType) {
  QuickAlert.show(
      context: context, title: "Alert", text: text, type: quickAlertType);
}
