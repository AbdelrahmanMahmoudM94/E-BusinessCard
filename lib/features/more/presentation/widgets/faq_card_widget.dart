import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karty/features/common/constants.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/more/domain/entities/faq_entity.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/routes/routes.dart';
import 'package:karty/features/routes/routes.gr.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/splash/presentation/screens/splash_screen.dart';
import 'package:super_tooltip/super_tooltip.dart';

class FaqCardWidget extends StatefulWidget {
  const FaqCardWidget({required this.faqEntity});
  final FaqEntity faqEntity;

  @override
  State<FaqCardWidget> createState() => _FaqCardWidgetState();
}

class _FaqCardWidgetState extends State<FaqCardWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.r))),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
        childrenPadding: EdgeInsets.symmetric(horizontal: 10.w),
        trailing: Icon(
          isExpanded ? FontAwesomeIcons.angleUp : FontAwesomeIcons.angleDown,
          color: AppTheme.inDarkMode(context,
              dark: Palette.white, light: Palette.grey_707070),
          size: 25.w,
        ),
        onExpansionChanged: (bool f) {
          isExpanded = f;
          setState(() {});
        },
        title: AppText(
          text: widget.faqEntity.question,
          style: AppTextStyle.semiBold_16,
          textColor: AppTheme.inDarkMode(context,
              dark: Palette.white, light: Palette.black),
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
            child: AppText(
              textColor: Palette.grey_7E7E7E,
              style: AppTextStyle.medium_16,
              text: widget.faqEntity.answer,
            ),
          )
        ],
      ),
    );
  }
}
