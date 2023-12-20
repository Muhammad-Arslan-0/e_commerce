import 'package:e_commerce/views/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  runApp(EasyLocalization(
      path: "assets/locales",
      supportedLocales: [Locale('en', ''), Locale('fr', ''), Locale('es', '')],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   final _connectionController =
  //       Get.put(ConnectionManagerController(), permanent: true);
  //   _connectionController.addListener(() {
  //     if (!_connectionController.isConnected.value) {
  //       myToast(false, "No Internet");
  //     } else if (_connectionController.isConnected.value) {
  //       myToast(true, "Connected to Internet");
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      title: 'E commerce',
      home: SplashScreen(),
    );
  }
}
