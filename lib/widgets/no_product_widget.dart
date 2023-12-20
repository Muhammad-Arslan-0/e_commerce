import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helper/app_images.dart';

class NoProductWidget extends StatelessWidget {
  final String text;
  const NoProductWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.emptyFolder,
            scale: 2,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22),
          ).tr()
        ],
      ),
    );
  }
}
