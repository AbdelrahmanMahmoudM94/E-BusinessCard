import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karty/features/common/constants.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/routes/router_observer.dart';
import 'package:karty/features/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:karty/features/shared/data/local_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  getIt.registerSingleton<AppRouter>(AppRouter());

  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await configureDependencies();
  final Locale locale = _getLocal();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const <Locale>[
        Locale('ar', 'KW'),
        Locale('en', 'US'),
      ],

      startLocale: locale,
      saveLocale: false,
      // locale: const Locale('ar', 'KW'),
      fallbackLocale: const Locale('ar', 'KW'),
      child: MyApp(),
    ),
  );
}

Locale _getLocal() {
  Locale locale;
  String? LangCode = LocalData.getLangCode() ?? "en";
  print("LangCode $LangCode");

  if (LangCode == "en") {
    locale = const Locale('en', 'US');
  } else {
    locale = const Locale('ar', 'KW');
  }

  return locale;
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  _MyAppState();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final AppRouter _appRouter = getIt<AppRouter>();
  ThemeMode? _themeMode;
  ThemeData? _theme;
  // This widget is the root of your application.
  Future<void> changeLanguage(Locale local) async {
    await context.setLocale(local);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: false,
      useInheritedMediaQuery: false,
      designSize: const Size(430, 896),
      builder: (BuildContext context, Widget? child) {
        _getThemeMode();
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(
            navigatorObservers: () => <NavigatorObserver>[
              CustomRouteObserver(),
            ],
          ),
          // darkTheme: AppTheme.darkTheme,
          theme: _theme ?? AppTheme.lightTheme,
          themeMode: _themeMode ?? ThemeMode.light,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: <LocalizationsDelegate>[
            FormBuilderLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            EasyLocalization.of(context)!.delegate,
          ],
          builder: EasyLoading.init(),
        );
      },
    );
  }

  void _getThemeMode() {
    final bool isDarkMode = LocalData.getApplicationTheme() ?? false;
    print("isDarkMode $isDarkMode");

    if (isDarkMode) {
      _themeMode = ThemeMode.dark;
      _theme = AppTheme.darkTheme;
    } else {
      _themeMode = ThemeMode.light;
      _theme = AppTheme.lightTheme;
    }
    Constants.themeMode = _themeMode;
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
      if (_themeMode == ThemeMode.light) {
        _theme = AppTheme.lightTheme;
      } else {
        _theme = AppTheme.darkTheme;
      }
    });
    Constants.themeMode = _themeMode;
  }
}
