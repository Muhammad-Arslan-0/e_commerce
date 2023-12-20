import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class MyTiles extends StatefulWidget {
  final IconData leadingIcon;
  final String title;
  final String? subTitle;
  final bool? isSwitch;
  const MyTiles(
      {super.key,
      required this.leadingIcon,
      required this.title,
      this.subTitle,
      this.isSwitch});

  @override
  State<MyTiles> createState() => _MyTilesState();
}

class _MyTilesState extends State<MyTiles> {
  final themeController = Get.find<ThemeController>();
  late bool switchValue;
  @override
  void initState() {
    if (widget.isSwitch != null) {
      setState(() {
        switchValue = widget.isSwitch!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:15.0),
      child: ListTile(
          leading: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.indigo,
            child: Icon(
              widget.leadingIcon,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ).tr(),
          subtitle: widget.subTitle != null
              ? Text(
                  widget.subTitle!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )
              : null,
          trailing: widget.isSwitch != null
              ? Obx(

                ()=>Switch(
                    value: themeController.isDarkMode.value,
                    onChanged: (v)=>themeController.toggleTheme()),
              )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.navigate_next, color: Colors.white),
                  ),
                )),
    );
  }
}
