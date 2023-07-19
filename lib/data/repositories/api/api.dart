import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  Dio _dio = Dio();

  API() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    _dio.interceptors.add(
        PrettyDioLogger()); // har request ko intercept krta hai interceptors
  }

  Dio get sendRequest => _dio;
}
