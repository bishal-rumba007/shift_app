import 'package:fpdart/fpdart.dart';
import '../../../../core/network/exception/failure.dart';
import '../../domain/entities/feature_config.dart';
import '../../domain/repositories/config_repository.dart';
import '../datasources/remote/config_remote_datasource.dart';


class ConfigRepositoryImpl implements ConfigRepository {
  final ConfigRemoteDataSource remote;

  ConfigRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, FeatureConfig>> getConfig() async {
    try {
      final result = await remote.getConfig();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure("Failed to load config"));
    }
  }
}