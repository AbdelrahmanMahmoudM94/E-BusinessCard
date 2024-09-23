import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/routes/routes.gr.dart';

@RoutePage()
class NavigationMainScreen extends StatefulWidget {
  const NavigationMainScreen({super.key});

  @override
  State<NavigationMainScreen> createState() => _NavigationMainScreenState();
}

class _NavigationMainScreenState extends State<NavigationMainScreen> {
  List<String> screensTitles = <String>[
    "profile",
    "scan",
    "shareCards",
    "more",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AutoTabsScaffold(
        resizeToAvoidBottomInset: false,
        routes: <PageRouteInfo>[
          const HomeProfileRoute(),
          ScanRoute(),
          const ShareCardsRoute(),
          const MoreRoute()
        ],
        bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
          return buildBottomBar(tabsRouter);
        },
      ),
    );
  }

  Widget buildBottomBar(TabsRouter tabsRouter) {
    return PopScope(
      canPop: tabsRouter.activeIndex == 0,
      onPopInvoked: (bool didPop) async {
        if (!didPop) {
          tabsRouter.setActiveIndex(0);
        }
      },
      child: Offstage(
        offstage:
            context.topRouteMatch.meta['hideBottomNav'] == true ? true : false,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SvgPicture.asset("assets/svg/profile-icon-bottom.svg"),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SvgPicture.asset(
                  "assets/svg/scan-icon-bottom.svg",
                  colorFilter:
                      ColorFilter.mode(Palette.blue_0DBDFF, BlendMode.srcIn),
                ),
              ),
              label: context.tr('profile'),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SvgPicture.asset("assets/svg/scan-icon-bottom.svg"),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SvgPicture.asset(
                  "assets/svg/scan-icon-bottom.svg",
                  colorFilter:
                      ColorFilter.mode(Palette.blue_0DBDFF, BlendMode.srcIn),
                ),
              ),
              label: context.tr('scan'),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SvgPicture.asset(
                  "assets/svg/share-cards-icon-bottom.svg",
                  colorFilter: ColorFilter.mode(
                      AppTheme.inDarkMode(context,
                          dark: Palette.white, light: Palette.grey_707070)!,
                      BlendMode.srcIn),
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SvgPicture.asset(
                  "assets/svg/contacts-colored.svg",
                ),
              ),
              label: context.tr('shareCards'),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SvgPicture.asset("assets/svg/more-icon-button.svg"),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SvgPicture.asset(
                  "assets/svg/more-icon-button.svg",
                  colorFilter:
                      ColorFilter.mode(Palette.blue_0DBDFF, BlendMode.srcIn),
                ),
              ),
              label: context.tr('more'),
            ),
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: (int index) {
            if (index == tabsRouter.activeIndex) {
              tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(index);
            }
          },
        ),
      ),
    );
  }
}
