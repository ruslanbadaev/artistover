import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class BottomNavBar extends StatelessWidget {
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
        init: BottomNavBarController(),
        builder: (controller) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[],
          );
        });
  }
}
