import 'package:flutter/material.dart';
import 'package:quotes/src/core/utils/app_colors.dart';
import 'package:quotes/src/core/utils/app_strings.dart';

class QuoteAppBar extends StatelessWidget implements PreferredSize {
  const QuoteAppBar({
    required this.title,
    this.textStyle,
    this.centerTitle,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);
  final String title;
  final TextStyle? textStyle;
  final bool? centerTitle;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: textStyle ??TextStyle(fontSize:24,fontFamily: AppStrings.fontFamily,fontWeight: FontWeight.bold,color: AppColors.black),
      ),
      centerTitle: centerTitle ?? true,
        backgroundColor: backgroundColor ?? AppColors.white,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity,46);
}