import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/shared/widgets/app_text.dart';

class LanguageButtonWidget extends StatelessWidget {
  const LanguageButtonWidget(
      {super.key, required this.text, this.isSelected = true, this.onTap});
  final String text;
  final void Function()? onTap;

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 35.w,
        height: 35.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Palette.primaryColor : Palette.white),
        child: Center(
          child: AppText(
            text: text,
            textColor: isSelected ? Palette.white : Palette.textDisabled,
            style: AppTextStyle.semiBold_15,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
