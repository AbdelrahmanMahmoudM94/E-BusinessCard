import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/shared/widgets/app_text.dart';

class TextAreaFieldWidget extends StatelessWidget {
  const TextAreaFieldWidget({
    super.key,
    required this.keyName,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.contentPadding,
    this.labelAboveField,
    this.maxLines,
    this.controller,
    this.onSubmitted,
    this.maxLength,
    this.onSaved,
  });
  final int? maxLength;
  final String keyName;
  final String? labelAboveField;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final void Function(String?)? onSubmitted;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
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
            textInputAction: TextInputAction.done,
            maxLines: maxLines ?? 9,
            maxLength: maxLength,
            controller: controller,
            onSaved: onSaved,
            name: keyName,
            onSubmitted: onSubmitted,
            validator: validator,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: contentPadding ??
                    EdgeInsets.symmetric(
                      vertical: 10..h,
                      horizontal: 17.w,
                    ),
                hintText: hintText,
                hintStyle: hintStyle,
                suffixIcon: suffixIcon),
          ),
        ),
      ],
    );
  }
}
