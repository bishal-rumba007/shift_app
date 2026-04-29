abstract class AppException implements Exception {
  final String message;
  final int? code;

  AppException(this.message, [this.code]);
}

class ServerException extends AppException {
  ServerException(super.message, [super.code]);
}

class NetworkException extends AppException {
  NetworkException(super.message);
}

class TimeoutException extends AppException {
  TimeoutException(super.message);
}

class CacheException extends AppException {
  CacheException(super.message);
}

class UnknownException extends AppException {
  UnknownException(super.message);
}