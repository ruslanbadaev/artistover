import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Function onTap;
  final List<Color>? gradientColors;
  final Widget icon;

  LinkButton({
    required this.title,
    required this.width,
    required this.height,
    required this.onTap,
    this.gradientColors,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: gradientColors ?? [AppColors.PRIMARY.withOpacity(.7), AppColors.SECONDARY.withOpacity(.8)],
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Text(
              title,
              style: TextStyle(color: AppColors.WHITE, fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Spacer(),
            icon,
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
