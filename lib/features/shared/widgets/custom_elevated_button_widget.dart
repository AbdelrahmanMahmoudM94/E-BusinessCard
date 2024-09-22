import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/shared/widgets/app_text.dart';

class CustomElevatedButton extends StatefulWidget {
  CustomElevatedButton(
      {super.key,
      this.width,
      this.height,
      this.text,
      this.backgroundColor,
      required this.onPressed,
      this.textStyle,
      this.borderColor,
      this.textColor,
      this.radius,
      this.customChild,
      this.elevation,
      this.textLimit,
      this.fontWeight,
      this.fontSize,
      this.applyShadow = false,
      this.removeWidth = false,
      this.offestShadowY = 3,
      this.gradient});
  double? width;
  double? height;
  Color? backgroundColor;
  Color? borderColor;
  String? text;
  AppTextStyle? textStyle;
  Color? textColor;
  void Function() onPressed;
  double? radius;
  Widget? customChild;
  double? elevation;
  final int? textLimit;
  final AppFontWeight? fontWeight;
  final num? fontSize;
  final bool applyShadow;
  final bool removeWidth;
  final double offestShadowY;
  final Gradient? gradient;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.removeWidth ? null : widget.width ?? 1.sw,
      height: widget.height ?? 50.h,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        gradient: widget.gradient,
        borderRadius: BorderRadius.circular(widget.radius ?? 30.r),
        boxShadow: widget.applyShadow
            ? <BoxShadow>[
                BoxShadow(
                  blurRadius: 6,
                  offset: Offset(0, widget.offestShadowY),
                  color: const Color(0x29000000),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                widget.backgroundColor != null
                    ? widget.backgroundColor!
                    : Colors.transparent),
            elevation: WidgetStateProperty.resolveWith<double>(
              // As you said you dont need elevation. I'm returning 0 in both case
              (Set<WidgetState> states) {
                if (widget.elevation != null) {
                  return widget.elevation!;
                }
                return 0; // Defer to the widget's default.
              },
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 20.r),
                side: BorderSide(
                  color: widget.borderColor ?? Palette.white,
                  width: 2,
                ),
              ),
            ),
          ),
          onPressed: () {
            FocusManager.instance.primaryFocus!.unfocus();
            widget.onPressed();
          },
          child:widget.customChild ?? AppText(
            text: widget.text ?? "",
            style: widget.textStyle,
            textColor: widget.textColor ??
                (widget.backgroundColor != Palette.white
                    ? Palette.white
                    : null),
            textLimit: widget.textLimit,
            lineHeight: 1,
          )),
    );
  }
}
