import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:doc_template/GenerateDocx/data/repositories/GenerateDocxRepositoryImpl.dart';
import 'package:doc_template/GenerateDocx/presentation/manager/GenerateDocxProvider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'Core/NetworkInfo/network_info.dart';
import 'GenerateDocx/data/repositories/ValidationRepositoryImpl.dart';
import 'GenerateDocx/domain/repositories/GenerateDocxRepository.dart';
import 'GenerateDocx/domain/repositories/ValidationRepository.dart';
import 'GenerateDocx/domain/use_cases/GenerateDocx.dart';
import 'GenerateDocx/domain/use_cases/Validation/ValidationList.dart';
import 'GenerateDocx/domain/use_cases/Validation/ValidationSubTitle.dart';
import 'GenerateDocx/domain/use_cases/Validation/ValidationTitle.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Feature
  generateDocx;

  ///Core
  core;

  ///External
  external;
}

void get generateDocx {
  //provider
  sl.registerFactory(
    () => GenerateDocxProvider(
      generateDocx: sl(),
      validationList: sl(),
      validationSubTitle: sl(),
      validationTitle: sl(),
    ),
  );

  //Use cases
  sl.registerLazySingleton(() => GenerateDocx(sl()));
  sl.registerLazySingleton(() => ValidationList(sl()));
  sl.registerLazySingleton(() => ValidationSubTitle(sl()));
  sl.registerLazySingleton(() => ValidationTitle(sl()));

  //repository
  sl.registerLazySingleton<GenerateDocxRepository>(
    () => GenerateDocxRepositoryImpl(),
  );

  sl.registerLazySingleton<ValidationRepository>(
    () => ValidationRepositoryImpl(),
  );
}

void get core {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

void get external {
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
