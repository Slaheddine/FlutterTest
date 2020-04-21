import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapptest/config.dart';

import 'LoggingInterceptors.dart';


abstract class HttpManager {


  Dio _dio = new Dio();

  @protected
  String baseURL = Config.baseUrl;


  HttpManager() {
    _dio.options.baseUrl = baseURL;
    _dio.options.connectTimeout = 30000; //30s
    _dio.options.receiveTimeout = 10000;

    _dio.interceptors.add(new LoggingInterceptors());
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