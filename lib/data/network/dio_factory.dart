// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/app/app_prefs.dart';
import 'package:mvvm/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content_type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeOut = 60 * 1000; //* 1 minute

    String language = await _appPreferences.getAppLanguage();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: language
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: Duration(minutes: timeOut),
        receiveTimeout: Duration(minutes: timeOut),
        headers: headers);

    if (kReleaseMode) {
      print('release mode no logs');
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
