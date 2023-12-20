import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notification_controller.dart';
import '../helper/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                tileColor: AppColors.cardBgColor.withOpacity(.35),
                leading: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo),
                  child: controller.notifications[index].icon,
                ),
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.notifications[index].title,
                            style: TextStyle(fontWeight: FontWeight.w600))
                        .tr(),
                    Text(controller.notifications[index].subtitle,
                            style: TextStyle(fontWeight: FontWeight.w600))
                        .tr(),
                  ],
                ),
                subtitle: Text(controller.notifications[index].time),
              ),
            );
          }),
    );
  }
}
