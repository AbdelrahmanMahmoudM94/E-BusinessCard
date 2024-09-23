import 'package:auto_route/auto_route.dart';
import 'package:karty/features/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: SplashRoute.page, path: "/splash", initial: true),
        CustomRoute(
            page: LoginRoute.page,
            path: "/login",
            transitionsBuilder: TransitionsBuilders.fadeIn),
        AutoRoute(
            page: NavigationMainRoute.page,
            path: "/bottomSheet",
            children: <AutoRoute>[
              AutoRoute(
                page: HomeProfileRoute.page,
                path: "profile",
              ),
              AutoRoute(
                page: ScanRoute.page,
                path: "scan",
                meta: <String, dynamic>{'hideBottomNav': true},
                maintainState: false,
              ),
              AutoRoute(
                  page: ShareCardsRoute.page,
                  path: "contacts",
                  maintainState: false),
              AutoRoute(
                page: MoreRoute.page,
                path: "more",
              ),
            ]),
        AutoRoute(
          page: ContactDetailsRoute.page,
          path: "/contactDetails",
        ),
        AutoRoute(
          page: FaqRoutes.page,
          path: "/Faqs",
        ),
        AutoRoute(
          page: EditProfileRoute.page,
          path: "/editProfile",
        ),
        AutoRoute(
          page: ScanResultRoute.page,
          path: "/scanResult",
        )
      ];
}
