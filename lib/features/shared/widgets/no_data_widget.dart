import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/shared/widgets/app_text.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        200.heightBox,
        SvgPicture.asset(
          'assets/svg/no-data-icon.svg',
          width: 80.w,
          colorFilter: ColorFilter.mode(Palette.primaryColor, BlendMode.srcIn),
        ),
        40.heightBox,
        AppText(
          text: context.tr("noDataFound"),
          style: AppTextStyle.semiBold_18,
          textColor: AppTheme.inDarkMode(context,
              dark: Palette.white, light: Palette.black),
        )
      ],
    );
  }
}
