import 'package:fpdart/fpdart.dart';
import '../network/exception/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> execute(Params params);
}


class NoParams {}