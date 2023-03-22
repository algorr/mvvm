// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:mvvm/app/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content_type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeOut = 60 * 1000; //* 1 minute

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: 'en'
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: Duration(minutes: timeOut),
        receiveTimeout: Duration(minutes: timeOut),
        headers: headers);

    return dio;
  }
}
