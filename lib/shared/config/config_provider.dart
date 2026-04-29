import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:shift_app/shared/config/data/datasources/remote/config_remote_datasource_impl.dart';
import 'package:shift_app/shared/config/domain/usecases/get_feature_config_usecase.dart';
import 'package:shift_app/shared/config/remote_config_service.dart';

import 'data/datasources/remote/config_remote_datasource.dart';
import 'data/repositories/config_repository_impl.dart';
import 'domain/repositories/config_repository.dart';


final remoteConfigProvider =
    Provider<FirebaseRemoteConfig>((ref) {
  return FirebaseRemoteConfig.instance;
});

final remoteConfigServiceProvider = Provider<RemoteConfigService>((ref) {
  return RemoteConfigService(FirebaseRemoteConfig.instance);
});

final configDataSourceProvider =
    Provider<ConfigRemoteDataSource>((ref) {
  return FirebaseConfigDataSource(
    ref.watch(remoteConfigProvider),
  );
});

final configRepositoryProvider =
    Provider<ConfigRepository>((ref) {
  return ConfigRepositoryImpl(
    ref.watch(configDataSourceProvider),
  );
});

final getConfigUseCaseProvider =
    Provider<GetConfigUseCase>((ref) {
  return GetConfigUseCase(
    ref.watch(configRepositoryProvider),
  );
});



