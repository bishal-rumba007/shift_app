// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:shift_app/shared/config/config_provider.dart';

// import '../../../../core/usecase/use_case.dart';
// import '../../domain/usecases/get_feature_config_usecase.dart';
// import 'config_state.dart';

// part 'config_notifier.g.dart';

// @riverpod
// class ConfigNotifier extends _$ConfigNotifier {
//   late final GetConfigUseCase _useCase;

//   @override
//   Future<ConfigState> build() async {
//     _useCase = ref.read(getConfigUseCaseProvider);
//     return await _load();
//   }

//   Future<ConfigState> _load() async {
//     final result = await _useCase.execute(NoParams());

//     return result.fold(
//       (failure) => ConfigState(loading: false, error: failure.message),
//       (config) => ConfigState(loading: false, config: config),
//     );
//   }

//   Future<void> refresh() async {
//     // ✅ Fix 1: Wrap in AsyncValue.guard — state is AsyncValue<ConfigState>,
//     // not ConfigState directly, so copyWith doesn't exist on state
//     state = const AsyncValue.loading();

//     // ✅ Fix 2: Actually update state with the result of _load()
//     state = await AsyncValue.guard(() => _load());
//   }
// }

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/usecase/use_case.dart';
import '../../domain/entities/feature_config.dart';
import '../../domain/usecases/get_feature_config_usecase.dart';
import 'package:shift_app/shared/config/config_provider.dart';

part 'config_notifier.g.dart';

@riverpod
class ConfigNotifier extends _$ConfigNotifier {
  late final GetConfigUseCase _useCase;

  @override
  Future<FeatureConfig> build() async {
    _useCase = ref.read(getConfigUseCaseProvider);

    final result = await _useCase.execute(NoParams());

    return result.fold(
      (failure) => throw Exception(failure.message),
      (config) => config,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await _useCase.execute(NoParams());

      return result.fold(
        (failure) => throw Exception(failure.message),
        (config) => config,
      );
    });
  }
}