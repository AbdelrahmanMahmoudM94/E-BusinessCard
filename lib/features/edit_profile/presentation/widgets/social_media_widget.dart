import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/profile/presentation/widgets/profile_personal_data_widget.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:karty/features/shared/widgets/forms/text_field_widget.dart';

class SocialMediaWidget extends StatelessWidget {
  SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
        SocialMediaField(
          icon: "linked-in.svg",
          keyName: "",
          iconWidth: 20.w,
          initalValue: "https://www.linkedin.com/diyar",
        ),
        SocialMediaField(
          icon: "facebook.svg",
          keyName: "",
          iconWidth: 13.w,
          initalValue: "https://www.facebook.com/diyar",
        ),
        SocialMediaField(
          icon: "instagram.svg",
          keyName: "",
          iconWidth: 20.w,
          initalValue: "https://www.instgram.com/diyar",
        ),
        SocialMediaField(
          icon: "twitter.svg",
          keyName: "",
          iconWidth: 25.w,
        ),
        160.heightBox,
        CustomElevatedButton(
          onPressed: () {},
          height: 64.h,
          width: 390.w,
          radius: 20.r,
          text: context.tr("save"),
          textStyle: AppTextStyle.bold_18,
          borderColor: Colors.transparent,
          gradient: LinearGradient(
              colors: <Color>[Palette.blue_0DBDFF, Palette.blue_05A3DF]),
        )
      ],
    );
  }
}

class SocialMediaField extends StatelessWidget {
  const SocialMediaField(
      {super.key,
      required this.icon,
      required this.keyName,
      required this.iconWidth,
      this.initalValue});
  final String icon;
  final double iconWidth;
  final String keyName;
  final String? initalValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFieldWidget(
        initalValue: initalValue ?? "https://www.instagram.com/diyar",
        keyName: "",
        prefixIcon: Container(
          width: 10.w,
          child: Center(
            child: SvgPicture.asset(
              "assets/svg/$icon",
              width: iconWidth,
            ),
          ),
        ),
      ),
    );
  }
}
