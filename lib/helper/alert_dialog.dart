import 'package:flutter/material.dart';

Future myAlertDialog({
  required BuildContext context,
  required AlertDialog alertDialog,
}) async {
  return await showDialog(
      context: context,
      builder: (builderContext) {
        return alertDialog;
      });
}
