import 'package:e_commerce_admin/app_router/router.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static showDialogFunction(String content){
    showDialog(
        context: AppRouter.navKey.currentContext!,
        builder: (context) => AlertDialog(
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  AppRouter.popRouter();
                },
                child: Text("Ok"))
          ],
        ));
  }
}