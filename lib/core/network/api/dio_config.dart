import 'package:cooking_app/core/network/api/constant.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  DioConfig._();

  static Dio? dio;

  static Dio getDio() {
    BaseOptions options = BaseOptions(
        receiveTimeout: const Duration(seconds: 12),
        connectTimeout: const Duration(seconds: 12),
        baseUrl: baseUrl);
    dio ??= Dio(options);
    dio!.interceptors.add(
        PrettyDioLogger(requestHeader: true, responseBody: true, error: true));
    return dio!;
  }
}
