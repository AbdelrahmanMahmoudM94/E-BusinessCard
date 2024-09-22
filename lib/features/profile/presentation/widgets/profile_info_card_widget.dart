import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/profile/presentation/widgets/profile_personal_data_widget.dart';
import 'package:karty/features/share_cards/domain/entities/contact_profile_entity.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:super_tooltip/super_tooltip.dart';

class ProfileInfoCardWidget extends StatelessWidget {
  const ProfileInfoCardWidget(
      {super.key,
      this.hideBorder = false,
      this.padding,
      required this.contactProfileEntity});
  final bool hideBorder;
  final EdgeInsetsGeometry? padding;
  final ContactProfileEntity contactProfileEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(left: 35.w, right: 35.w, top: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          border: hideBorder ? null : Border.all(color: Palette.grey_D4CDCD)),
      child: Column(
        children: <Widget>[
          IconWithText(
            text: contactProfileEntity.position!,
            icon: "title.png",
          ),
          IconWithText(
            text: contactProfileEntity.phoneNumber!,
            icon: "phone-icon.png",
          ),
          IconWithText(
            text: contactProfileEntity.location!,
            icon: "location-icon.png",
          ),
          IconWithText(
            text: contactProfileEntity.email!,
            icon: "email-icon.png",
            hasDivider: false,
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  IconWithText({
    required this.icon,
    required this.text,
    this.hasDivider = true,
  });
  final String text;
  final String icon;
  final bool hasDivider;
  SuperTooltipController controller = SuperTooltipController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              "assets/png/$icon",
              width: 25.w,
            ),
            10.widthBox,
            SuperTooltip(
              showBarrier: false,
              hasShadow: false,
              controller: controller,
              onShow: () {
                Future.delayed(Duration(seconds: 2), () {
                  controller.hideTooltip();
                });
              },
              content: AppText(
                text: text,
                textColor: Palette.white,
                style: AppTextStyle.semiBold_16,
                textAlign: TextAlign.center,
              ),
              backgroundColor: Palette.blue_0DBDFF,
              child: AppText(
                text: text,
                textLimit: 23,
                substringForDots: 1,
                style: AppTextStyle.semiBold_16,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        hasDivider
            ? Divider(
                color: Palette.grey_D4CDCD,
                thickness: 1,
              )
            : Container()
      ],
    );
  }
}
