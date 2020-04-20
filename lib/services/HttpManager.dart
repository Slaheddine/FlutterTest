import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapptest/config.dart';

import 'LoggingInterceptors.dart';


abstract class HttpManager {


  Dio _dio = new Dio();

  @protected
  String baseURL = Config.baseUrl;

  String _username = Config.userName;
  String _password = Config.password;

  HttpManager() {
    _dio.options.baseUrl = baseURL;
    _dio.options.connectTimeout = 30000; //30s
    _dio.options.receiveTimeout = 10000;

    _setAuthentificationHeader();
    _dio.interceptors.add(new LoggingInterceptors());
  }

  void _setAuthentificationHeader() {
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options) async {
          options.headers["Authorization"] = getAuthentificationToken();
          return options; //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse:(Response response) async {
          // Do something with response data
          return response; // continue
        },
        onError: (DioError e) async {
          // Do something with response error
          return  e;//continue
        }
    ));
  }

  String getAuthentificationToken() {
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_username:$_password'));
    return basicAuth;
  }


  @protected
  Future<dynamic> getRequest(String url, dynamic queryParameters, bool isFormUrlEncoded) async {

    Options options = new Options();
    if (isFormUrlEncoded) {
      options = new Options(contentType:Headers.formUrlEncodedContentType);
    }

    Response response = await _dio.get(url, queryParameters: queryParameters, options: options);

    print(response.statusCode);

    return response.data;
  }

  @protected
  Future<dynamic> patchRequest(String url, dynamic data, dynamic queryParameters, bool isFormUrlEncoded) async {


    Options options = new Options();
    if (isFormUrlEncoded) {
      options = new Options(contentType:Headers.formUrlEncodedContentType);
    }

    Response response = await _dio.patch(url, data: data, queryParameters: queryParameters, options: options);
    return response.data;
  }

  @protected
  Future<dynamic> postRequest(String url, dynamic data, dynamic queryParameters, bool isFormUrlEncoded) async {


    Options options = new Options();
    if (isFormUrlEncoded) {
      options = new Options(contentType:Headers.formUrlEncodedContentType);
    }

    Response response = await _dio.post(url, data: data, queryParameters: queryParameters, options: options);
    return response.data;
  }

  @protected
  Future<dynamic> putRequest(String url, dynamic data, dynamic queryParameters, bool isFormUrlEncoded) async {

    Options options = new Options();
    if (isFormUrlEncoded) {
      options = new Options(contentType:Headers.formUrlEncodedContentType);
    }

    Response response = await _dio.put(url, data: data, queryParameters: queryParameters, options: options);
    return response.data;
  }

  @protected
  Future<dynamic> deleteRequest(String url, dynamic data, dynamic queryParameters, bool isFormUrlEncoded) async {


    Options options = new Options();
    if (isFormUrlEncoded) {
      options = new Options(contentType:Headers.formUrlEncodedContentType);
    }

    Response response = await _dio.delete(url, data: data, queryParameters: queryParameters, options: options);
    return response.data;
  }


  List castDynamicToList(dynamic listResponse);
  dynamic castDynamicToObject(dynamic response);

}