import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/features/common/constants.dart';
import 'package:karty/features/routes/routes.dart';

import 'dependency_init.config.dart';

final GetIt getIt = GetIt.instance;
@InjectableInit(
  usesNullSafety: true,
  initializerName: r'$initGetIt', // default
  asExtension: false, // default
  preferRelativeImports: false,
)
Future<GetIt> configureDependencies() async {
   

  return $initGetIt(getIt);
}
