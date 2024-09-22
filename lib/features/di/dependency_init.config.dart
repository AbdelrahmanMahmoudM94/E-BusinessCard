// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:karty/core/network/network_helper.dart' as _i474;
import 'package:karty/features/di/register_module.dart' as _i828;
import 'package:karty/features/login/data/data_sources/login_data_sources.dart'
    as _i556;
import 'package:karty/features/login/data/repositories/login_repository_imp.dart'
    as _i378;
import 'package:karty/features/login/domain/repositories/login_repository.dart'
    as _i161;
import 'package:karty/features/login/domain/use_cases/get_app_config_use_case.dart'
    as _i434;
import 'package:karty/features/login/presentation/cubit/cubit/login_cubit.dart'
    as _i581;
import 'package:karty/features/more/data/data_sources/remote/more_data_sources.dart'
    as _i719;
import 'package:karty/features/more/data/repositories/more_repository_imp.dart'
    as _i234;
import 'package:karty/features/more/domain/repositories/more_repository.dart'
    as _i953;
import 'package:karty/features/more/domain/usecases/get_all_faq_use_case.dart'
    as _i1010;
import 'package:karty/features/more/presentation/cubit/cubit/more_cubit.dart'
    as _i544;
import 'package:karty/features/share_cards/data/data_sources/share_card_data_sources.dart'
    as _i456;
import 'package:karty/features/share_cards/data/repositories/share_card_repository_imp.dart'
    as _i33;
import 'package:karty/features/share_cards/domain/repositories/share_card_repository.dart'
    as _i693;
import 'package:karty/features/share_cards/domain/use_cases/get_all_share_cards_list_use_case.dart'
    as _i1066;
import 'package:karty/features/share_cards/domain/use_cases/get_contact_details_use_case.dart'
    as _i830;
import 'package:karty/features/share_cards/presentation/cubit/cubit/share_card_cubit.dart'
    as _i545;
import 'package:karty/features/shared/cubit/language/theme_cubit.dart' as _i630;

import 'package:karty/features/splash/data/data_sources/splash_data_sources.dart'
    as _i666;
import 'package:karty/features/splash/data/repositories/splash_repository_imp.dart'
    as _i569;
import 'package:karty/features/splash/domain/repositories/splash_repository.dart'
    as _i682;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();

  gh.factory<_i630.ThemeCubit>(() => _i630.ThemeCubit());
  await gh.singletonAsync<_i460.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
  gh.factory<_i474.NetworkHelper>(() => _i474.NetworkHelper(gh<_i361.Dio>()));
  gh.factory<_i719.MoreRemoteDataSource>(
      () => _i719.MoreRemoteDataSourceImpl(gh<_i474.NetworkHelper>()));
  gh.factory<_i953.MoreRepository>(() => _i234.MoreRepositoryImp(
      moreRemoteDataSource: gh<_i719.MoreRemoteDataSource>()));
  gh.factory<_i556.LoginRemoteDataSource>(
      () => _i556.LoginRemoteDataSourceImpl(gh<_i474.NetworkHelper>()));
  gh.factory<_i456.ShareCardRemoteDataSource>(
      () => _i456.MoreRemoteDataSourceImpl(gh<_i474.NetworkHelper>()));
  gh.factory<_i666.SplashRemoteDataSource>(
      () => _i666.SplashRemoteDataSourceImpl(gh<_i474.NetworkHelper>()));
  gh.factory<_i682.SplashRepository>(() => _i569.SplashRepositoryImp(
      splashRemoteDataSource: gh<_i666.SplashRemoteDataSource>()));
  gh.factory<_i161.LoginRepository>(() => _i378.LoginRepositoryImp(
      loginRemoteDataSource: gh<_i556.LoginRemoteDataSource>()));
  gh.factory<_i1010.GetAllFaqListUseCase>(() =>
      _i1010.GetAllFaqListUseCase(moreRepository: gh<_i953.MoreRepository>()));
  gh.factory<_i693.ShareCardRepository>(() => _i33.ShareCardRepositoryImp(
      shareCardRemoteDataSource: gh<_i456.ShareCardRemoteDataSource>()));
  gh.factory<_i544.MoreCubit>(() =>
      _i544.MoreCubit(getAllFaqListUseCase: gh<_i1010.GetAllFaqListUseCase>()));
  gh.factory<_i434.GetAppConfigUseCase>(() =>
      _i434.GetAppConfigUseCase(loginRepository: gh<_i161.LoginRepository>()));
  gh.factory<_i830.GetContactDetailsUseCase>(() =>
      _i830.GetContactDetailsUseCase(
          shareCardRepository: gh<_i693.ShareCardRepository>()));
  gh.factory<_i1066.GetAllShareCardsListUseCase>(() =>
      _i1066.GetAllShareCardsListUseCase(
          shareCardRepository: gh<_i693.ShareCardRepository>()));
  gh.factory<_i581.LoginCubit>(() =>
      _i581.LoginCubit(getAppConfigUseCase: gh<_i434.GetAppConfigUseCase>()));
  gh.factory<_i545.ShareCardCubit>(() => _i545.ShareCardCubit(
        getAllShareCardsListUseCase: gh<_i1066.GetAllShareCardsListUseCase>(),
        getContactDetailsUseCase: gh<_i830.GetContactDetailsUseCase>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i828.RegisterModule {}
