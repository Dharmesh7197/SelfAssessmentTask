import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:self_assesment_task/core/error/app_exception.dart';
import 'package:self_assesment_task/core/network/api_url.dart';
import 'package:self_assesment_task/core/network/root_service.dart';
import 'package:self_assesment_task/core/utility/pref_helper.dart';

class BaseService extends RootService {

  Dio? _dio;

  BaseService() {
    _dio = _initializeDio();
  }

  Dio _initializeDio() {
    Dio dioInstance = Dio(BaseOptions(
        baseUrl: ApiUrl.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60), // 60 seconds
        receiveTimeout: const Duration(seconds: 60), // 60 seconds
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        responseType: ResponseType.json));
    return dioInstance;
  }

  @override
  Future getResponse(String url) async {
    Response? response;
    try {
      String? token = PrefHelper().getString("token");
      log(token.toString());

      if (token == null || token.isEmpty) {
         try {
           response = await _dio!.get(url);
         }  catch (e) {
           log(e.toString());
         }
      } else {
        Map<String, dynamic> headers = Map();
        headers.putIfAbsent("Authorization", () => "Bearer $token");
        headers.putIfAbsent("Accept", () => "application/json");
        try {
          response = await _dio!.get(url, options: Options(headers: headers, contentType: "application/json",));
        } catch (e) {
          log(e.toString());
        }
      }

      log("------------------------");
      log(response.toString());
      log("------------------------");

    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Connection timeout');
    }
    return response;
  }

  @override
  Future getResponseWithQuery(String url, dynamic request) async {
    log(request.toString());
    Response? response;
    try {
      String? token = PrefHelper().getString("token");
      log(token.toString());
      Map<String, dynamic> headers = Map();
      headers.putIfAbsent("Authorization", () => "Bearer $token");
      headers.putIfAbsent("Accept", () => "application/json");
      if (token == null || token.isEmpty) {
         try {
           response = await _dio!.get(url, queryParameters:  request, options: Options(headers: headers, contentType: "application/json",));
         }  catch (e) {
           log(e.toString());
         }
      } else {
        headers.putIfAbsent("Auth", () => token);
        try {
          response = await _dio!.get(url, queryParameters:  request, options: Options(headers: headers, contentType: "application/json",));
        } catch (e) {
          log(e.toString());
        }
      }

      log("------------------------");
      log(response.toString());
      log("------------------------");

    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Connection timeout');
    }
    return response;
  }

  @override
  Future postResponse(String url, dynamic request) async {
    log(request.toString());
    Response? response;
    try {
      String? token = PrefHelper().getString("token");
      log(token.toString());

      if (token == null || token.isEmpty) {
        try {
          response = await _dio!.post(url, data: request);
        } catch (e) {
          log(e.toString());
        }

      } else {
        Map<String, dynamic> headers = Map();
        headers.putIfAbsent("Authorization", () => "Bearer $token");
        headers.putIfAbsent("Accept", () => "application/json");
        try {
          response = await _dio!
              .post(url, data: request, options: Options(headers: headers));
        } catch (e) {
          log(e.toString());
        }
      }

      log("------------------------");
      log(response.toString());
      log("------------------------");

    } on SocketException {
      log('No Internet Connection');
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Connection timeout');
    }
    return response;
  }

  @override
  Future dynamicGetResponse(String url,dynamic headers) async {
    Response? response;
    try {
      String? token = PrefHelper().getString("token");
      log(token.toString());

      if (token == null || token.isEmpty) {
        try {
          response = await _dio!.get(url);
        }  catch (e) {
          log(e.toString());
        }
      } else {
        headers.putIfAbsent("Authorization", () => "Bearer $token");
        headers.putIfAbsent("Accept", () => "application/json");
        try {
          response = await _dio!.get(url, options: Options(headers: headers, contentType: "application/json",));
        } catch (e) {
          log(e.toString());
        }
      }

      log("------------------------");
      log(response.toString());
      log("------------------------");

    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Connection timeout');
    }
    return response;
  }

  @override
  Future dynamicPostResponse(String url, dynamic request,dynamic headers) async {
    Response? response;
    try {
      String? token = PrefHelper().getString("token");
      log(token.toString());

      if (token == null || token.isEmpty) {
        try {
          response = await _dio!.post(url, data: request);
        } catch (e) {
          log(e.toString());
        }

      } else {
        headers.putIfAbsent("Authorization", () => "Bearer $token");
        headers.putIfAbsent("Accept", () => "application/json");
        try {
          response = await _dio!
              .post(url, data: request, options: Options(headers: headers));
        } catch (e) {
          log(e.toString());
        }
      }

      log("------------------------");
      log(response.toString());
      log("------------------------");

    } on SocketException {
      log('No Internet Connection');
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Connection timeout');
    }
    return response;
  }

}
