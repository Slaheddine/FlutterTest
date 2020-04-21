
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';

class UIUtils {

  static bool showErrorNotificationAlert(BuildContext context, String title, String body) {
    EdgeAlert.show(
        context, title: title,
        description: body,
        gravity: EdgeAlert.TOP,
        duration: EdgeAlert.LENGTH_LONG,
        backgroundColor: Colors.red,
        icon: Icons.error
    );
  }
}