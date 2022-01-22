import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

class OrganicButton extends StatelessWidget {
  final Function action;
  final String label;
  final IconData icon;
  OrganicButton(
    this.action,
    this.label,
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => action,
      color: AppColors.WHITE,
      child: Row(),
    );
  }
}
