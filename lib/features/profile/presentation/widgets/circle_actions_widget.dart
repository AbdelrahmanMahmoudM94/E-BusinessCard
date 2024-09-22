import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karty/features/common/utility/palette.dart';

class CircleActionsWidget extends StatelessWidget {
  const CircleActionsWidget({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 35.w,
        height: 35.w,
        decoration: BoxDecoration(color: Palette.white, shape: BoxShape.circle),
        child: Center(
            child: Icon(
          icon,
          color: Palette.black,
        )),
      ),
    );
  }
}
