import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karty/features/common/utility/palette.dart';

enum PatternExtension { png, svg }

class BackgroundPattern extends StatelessWidget {
  const BackgroundPattern({
    required this.path,
    required this.patternExtension,
    required this.widget,
    this.patternHeight,
    this.hasScroll = false,
    this.hasFoucs = false,
  });

  final String path;
  final PatternExtension? patternExtension;
  final Widget widget;
  final double? patternHeight;
  final bool? hasScroll;
  final bool? hasFoucs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              physics: MediaQuery.of(context).viewInsets.bottom > 0
                  ? ClampingScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      patternExtension == PatternExtension.svg
                          ? SvgPicture.asset(
                              path,
                              width: 1.sw,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              path,
                              width: 1.sw,
                              height: patternHeight,
                              fit: BoxFit.cover,
                            ),
                      widget
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
