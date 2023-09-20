
import 'package:flutter/material.dart';
import 'package:service/core/extensions/extensions.dart';
import '../constants.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_font_sizes.dart';
import '../resources/manager_font_weight.dart';
import '../resources/manager_height.dart';
import '../resources/manager_strings.dart';
import '../resources/manager_width.dart';

class BaseButton extends StatelessWidget {
  final int? spacerFlex;
  final String? title= ManagerStrings.start;
  final bool isVisibleIcon;
  final double ? width;
  final double ? height;
  final Color bgColor;
  final double elevation;
  void Function() onPressed;

  TextStyle? textStyle = TextStyle(
    fontSize: ManagerFontSizes.s16,
    fontWeight: ManagerFontWeight.regular,
    color: ManagerColors.white,
  );

  BaseButton({
    super.key,
    title ,
    this.isVisibleIcon = Constants.baseButtonVisibleIcon,
    this.width ,
    this.height ,
    this.bgColor = ManagerColors.primaryColor,
    this.textStyle,
    this.elevation = Constants.baseButtonElevation,
    this.spacerFlex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: bgColor,
        minimumSize: Size(
          width??ManagerWidth.w64,
          height ?? ManagerHeight.h50,),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0)
        ),


      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title.onNull(),
            style: textStyle??TextStyle(color: ManagerColors.white),
          ),



        ],
      ),
    );
  }
}
