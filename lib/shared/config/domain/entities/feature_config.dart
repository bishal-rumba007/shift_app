class FeatureConfig {
  final bool microMode;
  final bool focusMode;
  final String homeVariant;
  final int focusDuration;
  final String ctaText;

  final Map<String, dynamic> rawConfig;

  FeatureConfig({
    required this.microMode,
    required this.focusMode,
    required this.homeVariant,
    required this.focusDuration,
    required this.ctaText,
    required this.rawConfig,
  });
}