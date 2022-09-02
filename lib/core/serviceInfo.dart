import 'package:dio/dio.dart';

class ServerInfo {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';
  Dio getConnection() {
    Dio dio =  Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000000,
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.plain));
    return dio;
  }
}