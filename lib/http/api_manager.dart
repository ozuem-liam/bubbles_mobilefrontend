import 'package:bubbles/enums/api_status.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bubbles/http/custom_exception.dart';
import 'package:bubbles/http/formatted_response.dart';
import 'package:bubbles/http/network.dart' as networkutils;
import 'dart:developer' as mylogs;

class ApiManager {
  late Dio dio;
  // Development Environment
  //final baseURL = '';

  // Production Environment
  final baseURL = 'https://bubbles-xi.vercel.app';

  final Ref read;

  ApiManager(this.read) {
    final options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60), // 60 seconds
      receiveTimeout: const Duration(seconds: 60), // 90 seconds
    );

    dio = Dio(options);
  }

  //GET
  Future<FormattedResponse> getHttp(String route,
      {Map<String, dynamic>? params,
      bool formdata = false,
      dynamic token}) async {
    setHeader(formdata: formdata, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    // print(fullRoute);
    return makeRequest(dio.get(
      fullRoute,
      queryParameters: params,
    ));
  }

  //POST
  Future<FormattedResponse> postHttp(String route, dynamic body,
      {Map<String, dynamic>? params,
      bool formdata = false,
      bool formEncoded = false,
      dynamic token}) async {
    setHeader(formdata: formdata, formEncoded: formEncoded, token: token);
    params?.removeWhere((key, value) => value == null);
    //body?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    // print(fullRoute);
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    return makeRequest(dio.post(
      fullRoute,
      data: body,
      onSendProgress: networkutils.showLoadingProgress,
      onReceiveProgress: networkutils.showLoadingProgress,
      queryParameters: params,
    ));
  }

  //PUT
  Future<FormattedResponse> putHttp(String route, body,
      {Map<String, dynamic>? params, dynamic token}) async {
    setHeader(token: token);
    params?.removeWhere((key, value) => value == null);
    //body?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    // print(fullRoute);

    return makeRequest(dio.put(
      fullRoute,
      data: body,
      onSendProgress: networkutils.showLoadingProgress,
      onReceiveProgress: networkutils.showLoadingProgress,
      queryParameters: params,
    ));
  }

  //Patch
  Future patchHttp(String route, body,
      {Map<String, dynamic>? params, dynamic token}) async {
    setHeader(token: token);
    params?.removeWhere((key, value) => value == null);
    //body?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    //print(fullRoute);

    return makeRequest(dio.patch(
      fullRoute,
      data: body,
      onSendProgress: networkutils.showLoadingProgress,
      onReceiveProgress: networkutils.showLoadingProgress,
      queryParameters: params,
    ));
  }

  //DELETE
  Future deleteHttp(String route,
      {Map<String, dynamic>? params, dynamic data, dynamic token}) async {
    setHeader(token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';

    return makeRequest(dio.delete(
      fullRoute,
      data: data,
      queryParameters: params,
    ));
  }

  Future<FormattedResponse> makeRequest(Future<Response> future) async {
    Response? response;
    try {
      response = await future;
      if (kDebugMode) {
        //mylogs.log('code ${response.statusCode}');
        mylogs.log('response data ${response.data}');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        mylogs
            .log('HTTP SERVICE ERROR URL: ${e.response?.requestOptions.path}');
        mylogs.log('HTTP SERVICE ERROR MESSAGE: ${e.message}');
        mylogs.log('HTTP SERVICE ERROR DATA: ${e.response?.data}');
      }
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "Connection Timeout",
          success: false,
          statusCode: e.response?.statusCode,
        );
      } else if (e.type == DioExceptionType.unknown) {
        if (e.message!.contains('SocketException')) {
          return FormattedResponse(
            data: response?.data,
            responseCodeError:
                "Oops! An error occured. Please check your internet and try again.",
            success: false,
            statusCode: response!.statusCode,
          );
        }
      } else if (e.response!.statusCode == 401) {
        // _navigationService.navigateAndClearHistory(Routes.authScreen);
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "Session Expired",
          success: false,
          statusCode: e.response!.statusCode,
        );
      } else if (e.response!.statusCode == StatusCode.badRequest.name) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "Oops! Resource not found",
          success: false,
          statusCode: e.response!.statusCode,
        );
      } else if (e.response!.statusCode == StatusCode.serverError.name ||
          e.response!.statusCode == 503) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError:
              "Oops! It's not you, it's us. Give us a minute and then try again.",
          success: false,
          statusCode: e.response!.statusCode,
        );
      } else if (e.response!.statusCode == 400) {
        return FormattedResponse(
          data: e.response?.data,
          success: false,
          statusCode: e.response!.statusCode,
        );
      } else if (e.type == DioExceptionType.badResponse ||
          e.type == DioExceptionType.unknown) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "${e.error} - ${e.message}",
          success: false,
          statusCode: e.response!.statusCode,
        );
      }
      //ErrorManager.parseError(e);
    } catch (err) {
      if (err is DioException) {
        throw const CustomException('Something went wrong');
      }
      debugPrint(err.toString());
    }
    //debugPrint(response.toString());
    return FormattedResponse(
      data: response?.data,
      success: "${response?.statusCode}".startsWith('2'),
      statusCode: response!.statusCode,
    );
  }

  setHeader(
      {bool formdata = false, bool formEncoded = false, dynamic token}) async {
    final Map<String, dynamic> header = {
      'content-type': formdata
          ? 'multipart/form-data'
          : formEncoded
              ? 'application/x-www-form-urlencoded'
              : 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
    dio.options.headers.addAll(header);
  }

  void dispose() {
    //dio.clear();
    dio.close(force: true);
  }

  clearHeaders() {
    dio.options.headers.clear();
  }
}
