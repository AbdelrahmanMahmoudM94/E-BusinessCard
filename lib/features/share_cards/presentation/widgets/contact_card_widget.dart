import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/routes/routes.gr.dart';
import 'package:karty/features/share_cards/domain/entities/shard_card_entity.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/splash/presentation/screens/splash_screen.dart';
import 'package:super_tooltip/super_tooltip.dart';

class ContactCardWidget extends StatelessWidget {
  ContactCardWidget({
    super.key,
    required this.shareCardEntity,
  });
  final ShareCardEntity shareCardEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CustomMainRouter.push(
          ContactDetailsRoute(shareCardEntity: shareCardEntity)),
      child: Container(
        height: 110.h,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          elevation: 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  20.widthBox,
                  SvgPicture.asset(
                    "assets/svg/user-circle-icon.svg",
                    colorFilter: AppTheme.isDarkMode(context)
                        ? ColorFilter.mode(Palette.white, BlendMode.srcIn)
                        : null,
                  ),
                  10.widthBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextWithToolTip(
                        text: shareCardEntity.name!,
                        textLimit: 20,
                        textColor: AppTheme.inDarkMode(context,
                            dark: Palette.white, light: Palette.black)!,
                        style: AppTextStyle.semiBold_18,
                      ),
                      2.heightBox,
                      TextWithToolTip(
                        text: shareCardEntity.companyName!,
                        textLimit: 27,
                        textColor: Palette.grey_7B7B7B,
                        style: AppTextStyle.semiBold_16,
                      ),
                      2.heightBox,
                      TextWithToolTip(
                        text: shareCardEntity.position!,
                        textLimit: 34,
                        textColor: AppTheme.inDarkMode(context,
                            dark: Palette.grey_A6B0B3,
                            light: Palette.grey_A6B0B3)!,
                        style: AppTextStyle.semiBold_14,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: FaIcon(
                  LanguageHelper.isAr(context)
                      ? FontAwesomeIcons.chevronLeft
                      : FontAwesomeIcons.chevronRight,
                  color: Palette.grey_707070,
                  size: 20.w,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextWithToolTip extends StatelessWidget {
  TextWithToolTip(
      {super.key,
      required this.text,
      required this.textLimit,
      required this.textColor,
      required this.style});
  final String text;
  final int textLimit;
  final Color textColor;
  final AppTextStyle style;
  final SuperTooltipController controller = SuperTooltipController();
  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
        backgroundColor: Palette.blue_0DBDFF,
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
        child: AppText(
          text: text,
          textLimit: textLimit,
          substringForDots: 1,
          textColor: textColor,
          style: style,
        ));
  }
}
