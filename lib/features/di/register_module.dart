import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/api/network_apis_constants.dart';
import 'package:karty/features/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// this class register the third party plugins
@module
abstract class RegisterModule {
  // You can register named preemptive types like follows

  @Named("BaseUrl")
  String get baseUrl => ApiConstants.baseUrl;
  // url here will be injected
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  // @lazySingleton
  // FirebaseMessaging firebaseMessaging() => FirebaseMessaging.instance;

  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  // @preResolve
  // @lazySingleton
  // Future<SessionManager> get sessionManger async => SessionManager();
}
