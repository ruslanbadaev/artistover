import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ManualButton extends StatelessWidget {
  final Function action;
  final bool isShowManual;

  ManualButton({
    required this.action,
    required this.isShowManual,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 56, left: 16),
      child: ClipOval(
        child: Material(
          color: AppColors.PRIMARY,
          child: InkWell(
            splashColor: AppColors.SECONDARY,
            onTap: () => action(),
            child: SizedBox(
              width: 36,
              height: 36,
              child: isShowManual
                  ? Icon(
                      Icons.close,
                      size: 24,
                      color: AppColors.WHITE,
                    )
                  : Icon(
                      Icons.book_rounded,
                      size: 24,
                      color: AppColors.WHITE,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
