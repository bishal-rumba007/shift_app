import 'package:dio/dio.dart';
import '../exception/exceptions.dart';

class ExceptionHandler {
  Future<T> handle<T>(
    Future<T> Function() request,
  ) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw _mapDioException(e);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  AppException _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return TimeoutException("Request timed out");

      case DioExceptionType.connectionError:
        return NetworkException("No internet connection");

      case DioExceptionType.badResponse:
        final code = e.response?.statusCode ?? 500;

        if (code == 404) {
          return ServerException("Not found", code);
        } else if (code == 400) {
          return ServerException("Bad request", code);
        }

        return ServerException("Server error", code);

      default:
        return UnknownException("Unexpected error");
    }
  }
}