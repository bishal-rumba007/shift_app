// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConfigNotifier)
final configProvider = ConfigNotifierProvider._();

final class ConfigNotifierProvider
    extends $AsyncNotifierProvider<ConfigNotifier, FeatureConfig> {
  ConfigNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configNotifierHash();

  @$internal
  @override
  ConfigNotifier create() => ConfigNotifier();
}

String _$configNotifierHash() => r'b02125cbad11bd9616a6c0c7f7a2b18cf5b7c438';

abstract class _$ConfigNotifier extends $AsyncNotifier<FeatureConfig> {
  FutureOr<FeatureConfig> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<FeatureConfig>, FeatureConfig>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FeatureConfig>, FeatureConfig>,
              AsyncValue<FeatureConfig>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
