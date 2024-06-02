import 'package:flutter/material.dart';

import '../device_manager/colors.dart';
import '../device_manager/screen_constants.dart';
import '../device_manager/text_styles.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final Color? buttonColor;
  final TextStyle? buttonTextStyle;
  final EdgeInsets? padding;
  final iconButton;
  final buttonIcon;

  AppButton(
      {this.iconButton = false,
      this.buttonIcon,
      required this.onPressed,
      this.buttonText = "",
      this.buttonColor,
      this.buttonTextStyle,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return iconButton
        ? InkWell(
            onTap: onPressed, // button pressed
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                  border: Border.all(color: AppColors.lineColor, width: 2)),
              padding: padding ?? ScreenConstant.spacingAllSmall,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      buttonIcon ?? Icons.add,
                      color: AppColors.primaryColorDash,
                      size: 20,
                    ), // icon
                    Text(
                      buttonText.toUpperCase(),
                      style: buttonTextStyle ?? TextStyles.buttonText,
                    ), // text
                  ],
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: padding ?? ScreenConstant.spacingAllMedium,
              decoration: BoxDecoration(
                  color: buttonColor ?? AppColors.primaryColorDash,
                  borderRadius: BorderRadius.circular(10.0),
                  // set rounded corner radius
                  boxShadow: buttonColor != null
                      ? [
                          BoxShadow(
                              blurRadius: 2,
                              color: buttonColor ?? AppColors.primaryColorDash,
                              offset: Offset(0, 3))
                        ]
                      : [
                          const BoxShadow(
                              blurRadius: 2,
                              color: AppColors.buttonShadowColor,
                              offset: Offset(0, 3))
                        ] // make rounded corner of border
                  ),
              child: Center(
                child: Text(
                  buttonText.toUpperCase(),
                  style: buttonTextStyle != null
                      ? buttonTextStyle
                      : TextStyles.buttonText,
                ),
              ),
            ),
          );
  }
}
