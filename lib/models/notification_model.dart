import 'package:flutter/material.dart';

class NotificationModel {
  Widget icon;
  String title;
  String time;
  String subtitle;
  NotificationModel(
      {required this.icon,
      required this.title,
      required this.time,
      required this.subtitle});
}
