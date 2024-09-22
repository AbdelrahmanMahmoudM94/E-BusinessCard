import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/routes/routes.gr.dart';
import 'package:karty/features/scan/presentation/widgets/scan_qr_code_widget.dart';
import 'package:karty/features/shared/widgets/app_text.dart';

@RoutePage()
class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool isQrTapped = true;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black_111111,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            70.heightBox,
            InkWell(
              onTap: () => CustomMainRouter.navigate(
                  NavigationMainRoute(children: <PageRouteInfo>[
                ProfileRoute(),
              ])),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
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
            30.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Center(
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Palette.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        )),
                    child: Center(
                      child: AppText(
                        text: context.tr(isQrTapped
                            ? "scanCodeToGetData"
                            : "findACardToScan"),
                        textColor: Palette.white,
                        style: AppTextStyle.semiBold_18,
                      ),
                    )),
              ),
            ),
            10.heightBox,
            ExpandablePageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: <Widget>[
                ScanQrCodeWidget(),
                ScanQrCodeWidget(),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      isQrTapped = true;
                    });
                  },
                  child: AppText(
                    text: context.tr("qrCodeText"),
                    textColor:
                        isQrTapped ? Palette.primaryColor : Palette.grey_858c9e,
                    style: AppTextStyle.medium_19,
                  ),
                ),
                25.widthBox,
                InkWell(
                  onTap: () {
                    setState(() {
                      isQrTapped = false;
                    });
                  },
                  child: AppText(
                    text: context.tr("businessCard"),
                    textColor: !isQrTapped
                        ? Palette.primaryColor
                        : Palette.grey_858c9e,
                    style: AppTextStyle.medium_19,
                  ),
                ),
              ],
            ),
            20.heightBox,
            InkWell(
              onTap: () {
                CustomMainRouter.navigate(
                    NavigationMainRoute(children: <PageRouteInfo>[
                  ProfileRoute(),
                ]));
              },
              child: Center(
                child: AppText(
                  text: context.tr("cancel"),
                  textColor: Palette.white,
                  style: AppTextStyle.semiBold_19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
