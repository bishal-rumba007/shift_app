import 'package:fpdart/fpdart.dart';
import '../../../../core/network/exception/failure.dart';
import '../entities/feature_config.dart';

abstract class ConfigRepository {
  Future<Either<Failure, FeatureConfig>> getConfig();
}