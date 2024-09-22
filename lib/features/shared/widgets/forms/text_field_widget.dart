import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/shared/widgets/app_text.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.keyName,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.contentPadding,
    this.labelAboveField,
    this.maxLines,
    this.prefixIcon,
    this.initalValue,
    this.controller,
  });
  final String keyName;
  final String? labelAboveField;
  final String? hintText;
  final String? initalValue;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
    final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(
          text: labelAboveField,
          textColor: Palette.black,
          style: AppTextStyle.semiBold_18,
        ),
        Padding(
          padding: labelAboveField != null
              ? EdgeInsets.only(top: 10.h)
              : EdgeInsets.zero,
          child: FormBuilderTextField(
            maxLines: maxLines ?? 1,
            name: keyName,
            controller: controller,
            validator: validator,
            initialValue: initalValue,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: contentPadding ??
                    EdgeInsets.symmetric(
                      vertical: 18.h,
                      horizontal: 17.w,
                    ),
                hintText: hintText,
                hintStyle: hintStyle,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon),
          ),
        ),
      ],
    );
  }
}
