import 'package:fpdart/fpdart.dart';

import '../../../../core/network/exception/failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/feature_config.dart';
import '../repositories/config_repository.dart';

class GetConfigUseCase extends UseCase<FeatureConfig, NoParams> {
  final ConfigRepository repository;

  GetConfigUseCase(this.repository);

  @override
  Future<Either<Failure, FeatureConfig>> execute(NoParams params) {
    return repository.getConfig();
  }
}