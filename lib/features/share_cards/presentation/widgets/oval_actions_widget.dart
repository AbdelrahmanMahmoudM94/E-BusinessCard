import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karty/features/common/utility/palette.dart';

class OvalActionsWidget extends StatelessWidget {
  const OvalActionsWidget({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 25.w,
      decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
      child: Center(
        child: InkWell(
          onTap: onPressed,
          child: Icon(icon),
        ),
      ),
    );
  }
}
