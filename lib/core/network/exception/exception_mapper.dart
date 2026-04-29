import 'exceptions.dart';
import 'failure.dart';

Failure mapExceptionToFailure(AppException e) {
  if (e is ServerException) {
    return ServerFailure(e.message);
  } else if (e is NetworkException) {
    return NetworkFailure(e.message);
  } else if (e is TimeoutException) {
    return TimeoutFailure(e.message);
  } else if (e is CacheException) {
    return CacheFailure(e.message);
  } else {
    return UnknownFailure(e.message);
  }
}