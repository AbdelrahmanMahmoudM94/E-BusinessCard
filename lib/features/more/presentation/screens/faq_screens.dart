import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';

import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/more/presentation/cubit/cubit/more_cubit.dart';
import 'package:karty/features/more/presentation/widgets/faq_card_widget.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/background_pattern.dart';

@RoutePage()
class FaqScreens extends StatefulWidget {
  const FaqScreens({super.key});

  @override
  State<FaqScreens> createState() => _FaqScreensState();
}

class _FaqScreensState extends State<FaqScreens> {
  MoreCubit _moreCubit = getIt<MoreCubit>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      _moreCubit.getAllFaqList(LanguageHelper.isAr(context) ? "ar" : "en");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoreCubit>.value(
      value: _moreCubit,
      child: BackgroundPattern(
          path: "assets/svg/profile-background.svg",
          patternExtension: PatternExtension.svg,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              50.heightBox,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () => CustomMainRouter.pop(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(0.0),
                              width: 20.w,
                              child: Icon(
                                color: Palette.white,
                                LanguageHelper.isAr(context)
                                    ? FontAwesomeIcons.arrowRight
                                    : FontAwesomeIcons.arrowLeft,
                                size: 30.w,
                              ),
                            ),
                          ),
                        ),
                        4.widthBox,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: AppText(
                            text: context.tr("faq").toUpperCase(),
                            style: AppTextStyle.bold_21,
                            textColor: Palette.white,
                          ),
                        ),
                      ],
                    ),
                    LanguageHelper.isAr(context)
                        ? Image.asset(
                            "assets/png/company_arabic_logo.png",
                            width: 100.w,
                          )
                        : SvgPicture.asset(
                            ViewsToolbox.getDiyarLogo(context,
                                forcedLightTheme: true),
                            width: 110.w,
                          )
                  ],
                ),
              ),
              20.heightBox,
              BlocBuilder<MoreCubit, MoreState>(
                  builder: (BuildContext context, MoreState state) {
                if (state is FaqReadyState) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.only(
                                  top: 10.h, left: 30.w, right: 30.w),
                              child: FaqCardWidget(
                                faqEntity: state.faqList[index],
                              ));
                        },
                        itemCount: state.faqList.length,
                      ),
                    ),
                  );
                }
                return Container();
              }),
            ],
          )),
    );
  }
}
