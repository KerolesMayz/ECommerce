import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context,
      {bool isDismissible = false})
  {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 16,
              ),
              Text('Please Wait'),
            ],
          ),
        );
      },
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showErrorDialog(
    BuildContext context,
    String message, {
    String posActionName = "Ok",
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction,
    bool isDismissible = true,
  })
  {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        List<Widget> actions = [];
        if (posActionName.isNotEmpty) {
          actions.add(TextButton(
            onPressed: () {
              hideDialog(context);
              posAction?.call();
            },
            child: Text(posActionName),
          ));
        }

        if (negActionName != null && negActionName.isNotEmpty) {
          actions.add(TextButton(
            onPressed: () {
              hideDialog(context);
              negAction?.call();
            },
            child: Text(negActionName),
          ));
        }
        return AlertDialog(
          content: Text(message),
          actions: actions,
        );
      },
    );
  }

  static void showMessageDialog(
    BuildContext context,
    String message, {
    String posActionName = "Ok",
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction,
    bool isDismissible = true,
  })
  {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        List<Widget> actions = [];
        if (posActionName.isNotEmpty) {
          actions.add(TextButton(
            onPressed: () {
              hideDialog(context);
              posAction?.call();
            },
            child: Text(posActionName),
          ));
        }

        if (negActionName != null && negActionName.isNotEmpty) {
          actions.add(TextButton(
            onPressed: () {
              hideDialog(context);
              negAction?.call();
            },
            child: Text(negActionName),
          ));
        }

        return AlertDialog(
          content: Text(message),
          actions: actions,
        );
      },
    );
  }
}
