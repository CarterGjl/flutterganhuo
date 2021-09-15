import 'package:dio/dio.dart';

class Http {
  static const int CONNECT_TIME_OUT = 30000;
  static const int RECEIVE_TIME_OUT = 30000;

  static Http _instance = Http._internal();

  factory Http() => _instance;

  Dio? dio;

  Http._internal() {
    if (dio == null) {
      var baseOptions = BaseOptions(
          connectTimeout: CONNECT_TIME_OUT,
          receiveTimeout: RECEIVE_TIME_OUT,
          headers: {});
      dio = Dio(baseOptions);
    }
  }

  void init(
      {required String baseUrl,
      int? connectTimeout,
      int? receiveTimeout,
      List<Interceptor>? interceptors}) {
    // dio!.options = dio!.options.merge(
    //   baseUrl: baseUrl,
    //   connectTimeout: connectTimeout,
    //   receiveTimeout: receiveTimeout,
    // );
    if (interceptors != null && interceptors.isNotEmpty) {
      dio!.interceptors..addAll(interceptors);
    }
  }
}
