import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:e_commerce/widgets/my_tiles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int selectedRadioTile = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var locale = context.locale;
    if (locale == context.supportedLocales[0]) {
      setState(() {
        selectedRadioTile = 1;
      });
    } else if (locale == context.supportedLocales[1]) {
      setState(() {
        selectedRadioTile = 2;
      });
    } else if (locale == context.supportedLocales[2]) {
      setState(() {
        selectedRadioTile = 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.account,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        letterSpacing: 2))
                .tr(),
            MyTiles(
                leadingIcon: Icons.person,
                title: "Alice Smith",
                subTitle: "+191 23 456 7890"),
            Text(LocaleKeys.settings,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        letterSpacing: 2))
                .tr(),
            SizedBox(height: 10),
            MyTiles(
                leadingIcon: Icons.nightlight_outlined,
                title: LocaleKeys.dark_mode,
                isSwitch: true),
            GestureDetector(
                onTap: () {
                  Get.dialog(Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.language,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ).tr(),
                          RadioListTile(
                              title: Text("English"),
                              value: 1,
                              groupValue: selectedRadioTile,
                              onChanged: (v) async {
                                await context
                                    .setLocale(context.supportedLocales[0]);
                                // setState(() {
                                //   selectedRadioTile = int.parse(v.toString());
                                // });

                                Get.back();
                                Restart.restartApp();
                              }),
                          RadioListTile(
                              title: Text("French"),
                              value: 2,
                              groupValue: selectedRadioTile,
                              onChanged: (v) async {
                                await context
                                    .setLocale(context.supportedLocales[1]);
                                // setState(() {
                                //   selectedRadioTile = int.parse(v.toString());
                                // });

                                Get.back();
                                Restart.restartApp();
                              }),
                          RadioListTile(
                              title: Text("Spanish"),
                              value: 3,
                              groupValue: selectedRadioTile,
                              onChanged: (v) async {
                                await context
                                    .setLocale(context.supportedLocales[2]);
                                // setState(() {
                                //   selectedRadioTile = int.parse(v.toString());
                                // });
                                Get.back();
                                Restart.restartApp();
                              })
                        ],
                      ),
                    ),
                  ));
                },
                child: MyTiles(
                    leadingIcon: Icons.language, title: LocaleKeys.language)),
            MyTiles(leadingIcon: Icons.help, title: LocaleKeys.help),
            MyTiles(leadingIcon: Icons.logout, title: LocaleKeys.sign_out)
          ],
        ),
      ),
    );
  }
}
