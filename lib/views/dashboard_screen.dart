import 'package:e_commerce/controllers/dashboard_controller.dart';
import 'package:e_commerce/controllers/theme_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/connection_manager_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    final _themeController = Get.put(ThemeController());
    final _connectionController =
        Get.put(ConnectionManagerController());
    return Obx(() => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.appBarTitles[controller.currentIndex.value],
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ).tr(),
                    Container(
                      color: Colors.indigo,
                      height: 5,
                      width: Get.width * .3,
                    )
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    color: _themeController.isDarkMode.value
                        ? Colors.black26
                        : Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          offset: Offset(0, -1.5),
                          blurRadius: 5,
                          spreadRadius: 4)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: BottomNavigationBar(
                    currentIndex: controller.currentIndex.value,
                    showSelectedLabels: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    selectedItemColor: Colors.indigo,
                    unselectedItemColor: Colors.grey,
                    onTap: (index) {
                      controller.changeBottomIndex(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite), label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart), label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.notifications), label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.settings), label: ""),
                    ],
                  ),
                ),
              ),
              body: controller.screens[controller.currentIndex.value],
            ),
            Visibility(
                visible: !_connectionController.isConnected.value,
                child: Scaffold(
                  backgroundColor: Colors.black.withOpacity(.4),
                  body: Center(
                    child: Text(
                      "No Internet 😟",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ))
          ],
        ));
  }
}
