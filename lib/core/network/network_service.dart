import 'response/response.dart';

abstract class NetworkService {
  String get baseUrl;
  Map<String, Object> get headers;
  void updateHeader(Map<String, dynamic> data);

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Response> postMultipart(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? additionalHeaders,
  });

  Future<Response> put(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Response> putMultipart(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? additionalHeaders,
  });

  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
