import 'package:flutter/material.dart';

class CustomAppBarAction extends StatelessWidget {
  final Function action;
  final IconData icon;
  final int quantity;

  CustomAppBarAction(
    this.action,
    this.icon, {
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(),
    );
  }
}
