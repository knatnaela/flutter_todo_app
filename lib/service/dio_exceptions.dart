import 'package:dio/dio.dart';

import '../data/models/base_model/base_model.dart';

class DioExceptions implements Exception {
  late BaseModel baseResponse;
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        baseResponse = BaseModel(error: "Request cancelled");
        break;
      case DioErrorType.connectTimeout:
        baseResponse = BaseModel(error: "Connection timeout");

        break;
      case DioErrorType.other:
        baseResponse = BaseModel(error: "No internet connection");

        break;
      case DioErrorType.receiveTimeout:
        baseResponse = BaseModel(error: "Receive timeout");

        break;
      case DioErrorType.response:
        baseResponse = _handleError(
            dioError.response!.statusCode, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        baseResponse = BaseModel(error: "Send timeout");
        break;
      default:
        baseResponse = BaseModel(error: "Something went wrong");

        break;
    }
  }
  BaseModel _handleError(int? statusCode, data) {
    if (statusCode == 301) {
      return baseResponse = BaseModel(error: "Something went wrong");
    }
    final response = BaseModel.fromJson(data);
    switch (statusCode) {
      case 400:
        return baseResponse = BaseModel(error: response.error ?? "Bad Request");
      case 401:
      case 403:
        return baseResponse = BaseModel(error: response.error);
      case 404:
        return baseResponse = BaseModel(error: data?.error ?? "Page not found");
      case 405:
        return baseResponse = BaseModel(error: data?.error ?? "Not Supported");
      default:
        return baseResponse = BaseModel(error: "Something went wrong");
    }
  }
}
