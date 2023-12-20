import 'package:flutter/material.dart';

Widget CustomIcon(IconData icon, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.indigo, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    ),
  );
}
