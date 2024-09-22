// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i14;
import 'package:karty/features/edit_profile/presentation/screens/edit_profile_screen.dart'
    as _i2;
import 'package:karty/features/login/presentation/screens/login_screen.dart'
    as _i4;
import 'package:karty/features/more/presentation/screens/faq_screens.dart'
    as _i3;
import 'package:karty/features/more/presentation/screens/more_screen.dart'
    as _i5;
import 'package:karty/features/navigation_bottom/navigation_bottom.dart' as _i6;
import 'package:karty/features/profile/presentation/screens/profile_screen.dart'
    as _i7;
import 'package:karty/features/scan/domain/entities/qr_scaned_data.dart'
    as _i15;
import 'package:karty/features/scan/presentation/screens/scan_result_screen.dart'
    as _i8;
import 'package:karty/features/scan/presentation/screens/scan_screen.dart'
    as _i9;
import 'package:karty/features/share_cards/domain/entities/shard_card_entity.dart'
    as _i13;
import 'package:karty/features/share_cards/presentation/screens/contact_details_screen.dart'
    as _i1;
import 'package:karty/features/share_cards/presentation/screens/share_cards_screen.dart'
    as _i10;
import 'package:karty/features/splash/presentation/screens/splash_screen.dart'
    as _i11;
import 'package:qr_code_scanner/qr_code_scanner.dart' as _i16;

/// generated route for
/// [_i1.ContactDetailsScreen]
class ContactDetailsRoute extends _i12.PageRouteInfo<ContactDetailsRouteArgs> {
  ContactDetailsRoute({
    required _i13.ShareCardEntity shareCardEntity,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ContactDetailsRoute.name,
          args: ContactDetailsRouteArgs(shareCardEntity: shareCardEntity),
          initialChildren: children,
        );

  static const String name = 'ContactDetailsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ContactDetailsRouteArgs>();
      return _i1.ContactDetailsScreen(shareCardEntity: args.shareCardEntity);
    },
  );
}

class ContactDetailsRouteArgs {
  const ContactDetailsRouteArgs({required this.shareCardEntity});

  final _i13.ShareCardEntity shareCardEntity;

  @override
  String toString() {
    return 'ContactDetailsRouteArgs{shareCardEntity: $shareCardEntity}';
  }
}

/// generated route for
/// [_i2.EditProfileScreen]
class EditProfileRoute extends _i12.PageRouteInfo<void> {
  const EditProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i2.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i3.FaqScreens]
class FaqRoutes extends _i12.PageRouteInfo<void> {
  const FaqRoutes({List<_i12.PageRouteInfo>? children})
      : super(
          FaqRoutes.name,
          initialChildren: children,
        );

  static const String name = 'FaqRoutes';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i3.FaqScreens();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.MoreScreen]
class MoreRoute extends _i12.PageRouteInfo<void> {
  const MoreRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.MoreScreen();
    },
  );
}

/// generated route for
/// [_i6.NavigationMainScreen]
class NavigationMainRoute extends _i12.PageRouteInfo<void> {
  const NavigationMainRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NavigationMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationMainRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.NavigationMainScreen();
    },
  );
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i8.ScanResultScreen]
class ScanResultRoute extends _i12.PageRouteInfo<ScanResultRouteArgs> {
  ScanResultRoute({
    _i14.Key? key,
    _i15.QrScannedDataEntity? qrScannedDataEntity,
    required _i16.QRViewController controller,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ScanResultRoute.name,
          args: ScanResultRouteArgs(
            key: key,
            qrScannedDataEntity: qrScannedDataEntity,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'ScanResultRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ScanResultRouteArgs>();
      return _i8.ScanResultScreen(
        key: args.key,
        qrScannedDataEntity: args.qrScannedDataEntity,
        controller: args.controller,
      );
    },
  );
}

class ScanResultRouteArgs {
  const ScanResultRouteArgs({
    this.key,
    this.qrScannedDataEntity,
    required this.controller,
  });

  final _i14.Key? key;

  final _i15.QrScannedDataEntity? qrScannedDataEntity;

  final _i16.QRViewController controller;

  @override
  String toString() {
    return 'ScanResultRouteArgs{key: $key, qrScannedDataEntity: $qrScannedDataEntity, controller: $controller}';
  }
}

/// generated route for
/// [_i9.ScanScreen]
class ScanRoute extends _i12.PageRouteInfo<void> {
  const ScanRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.ScanScreen();
    },
  );
}

/// generated route for
/// [_i10.ShareCardsScreen]
class ShareCardsRoute extends _i12.PageRouteInfo<void> {
  const ShareCardsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ShareCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShareCardsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.ShareCardsScreen();
    },
  );
}

/// generated route for
/// [_i11.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.SplashScreen();
    },
  );
}
