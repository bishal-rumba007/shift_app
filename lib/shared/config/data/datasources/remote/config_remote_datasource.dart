import '../../models/feature_config_model.dart';

abstract class ConfigRemoteDataSource {
  Future<FeatureConfigModel> getConfig();
}