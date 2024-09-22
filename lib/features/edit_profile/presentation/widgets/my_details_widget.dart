import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/profile/presentation/widgets/profile_personal_data_widget.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:karty/features/shared/widgets/forms/text_area_field_widget.dart';

class MyDetailsWidget extends StatelessWidget {
  MyDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProfilePersonalDataWidget(
          name: "Fuad Taha",
          isStatic: true,
          companyName: "Diyar United Arab",
        ),
        40.heightBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: AppText(
            text: context.tr(
              "requestToHr",
            ),
            textColor: AppTheme.inDarkMode(context,
                dark: Palette.white, light: Palette.darkBlue),
            style: AppTextStyle.medium_17,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextAreaFieldWidget(
            maxLines: 8,
            keyName: "hrRequest",
            hintText: context.tr("yourRequestHere"),
            hintStyle: TextStyle(
                color: AppTheme.inDarkMode(context,
                    dark: Palette.white, light: Palette.grey_8e95a4),
                fontWeight: FontWeight.w500,
                fontSize: 18.sp),
            contentPadding: EdgeInsets.only(left: 20.w, top: 40.h, right: 20.w),
          ),
        ),
        40.heightBox,
        CustomElevatedButton(
          onPressed: () {},
          height: 64.h,
          width: 390.w,
          radius: 20.r,
          text: context.tr("submit"),
          textStyle: AppTextStyle.bold_18,
          borderColor: Colors.transparent,
          gradient: LinearGradient(
              colors: <Color>[Palette.blue_0DBDFF, Palette.blue_05A3DF]),
        )
      ],
    );
  }
}
