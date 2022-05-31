import 'package:flutter/material.dart';
import 'package:fashionizt/pages/login_screen.dart';
import '../constants.dart';

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
      BuildContext context,
      String title,
      String body,
      ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pop(DialogsAction.cancel),
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: blacksand, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push((context),
                  MaterialPageRoute(builder: (context){
                    return LoginScreen();
                  })
              ),
              child: Text(
                'Confirm',
                style: TextStyle(
                    color: blacksand, fontWeight: FontWeight.w700),
              ),
            )
          ],
        );
      },);
    return (action != null) ? action : DialogsAction.cancel;
  }
}