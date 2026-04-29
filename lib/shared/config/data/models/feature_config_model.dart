import '../../domain/entities/feature_config.dart';

class FeatureConfigModel extends FeatureConfig {
  FeatureConfigModel({
    required super.microMode,
    required super.focusMode,
    required super.homeVariant,
    required super.focusDuration,
    required super.ctaText,
    required super.rawConfig,
  });

  factory FeatureConfigModel.fromJson(Map<String, dynamic> json) {
    return FeatureConfigModel(
      microMode: json['micro_mode'] ?? false,
      focusMode: json['focus_mode'] ?? true,
      homeVariant: json['home_variant'] ?? "A",
      focusDuration: json['focus_duration'] ?? 10,
      ctaText: json['cta_text'] ?? "Start",
      rawConfig: json,
    );
  }
}