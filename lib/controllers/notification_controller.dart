import 'package:e_commerce/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/locale_keys.g.dart';

class NotificationController extends GetxController {
  List<NotificationModel> notifications = [
    NotificationModel(
        icon: Icon(Icons.notifications, color: Colors.white),
        title: LocaleKeys.new_notification_received,
        subtitle: LocaleKeys.your_cart_waiting_for_checkout,
        time: "10/06/2022 AT 05:30 PM"),
    NotificationModel(
        icon: Icon(Icons.notifications, color: Colors.white),
        title: LocaleKeys.new_notification_received,
        subtitle: LocaleKeys.your_cart_waiting_for_checkout,
        time: "10/06/2022 AT 05:30 PM"),
    NotificationModel(
        icon: Icon(Icons.notifications, color: Colors.white),
        title: LocaleKeys.new_notification_received,
        subtitle: LocaleKeys.your_cart_waiting_for_checkout,
        time: "10/06/2022 AT 05:30 PM"),
    NotificationModel(
        icon: Icon(Icons.notifications, color: Colors.white),
        title: LocaleKeys.new_notification_received,
        subtitle: LocaleKeys.your_cart_waiting_for_checkout,
        time: "10/06/2022 AT 05:30 PM"),
    NotificationModel(
        icon: Icon(Icons.notifications, color: Colors.white),
        title: LocaleKeys.new_notification_received,
        subtitle: LocaleKeys.your_cart_waiting_for_checkout,
        time: "10/06/2022 AT 05:30 PM"),
    NotificationModel(
        icon: Icon(Icons.notifications, color: Colors.white),
        title: LocaleKeys.new_notification_received,
        subtitle: LocaleKeys.your_cart_waiting_for_checkout,
        time: "10/06/2022 AT 05:30 PM"),
  ];
}
