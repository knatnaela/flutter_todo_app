import 'package:dio/dio.dart';
import 'package:flutter_todo_app/config/http_config.dart';
import 'package:flutter_todo_app/service/http/http_service.dart';

import '../../core/constants.dart';
import '../../di/get_it.dart' as getIt;
import '../secure_storage/secure_storage_service.dart';

enum HeaderType { secured, file, none }

class HttpServiceImpl implements HttpService {
  late Dio dio;
  late SecureStorageService secureStorageService;
  HttpServiceImpl(this.dio);
  @override
  Future<Response> getRequest(
      {required String urlPath,
      Map<String, dynamic> data = const {},
      HeaderType? headerType = HeaderType.secured}) async {
    Response response;
    const _extra = <String, dynamic>{};
    final queryParameters = data;
    try {
      response = await dio.get(
        urlPath,
        queryParameters: queryParameters,
        options: Options(
            method: 'GET',
            extra: _extra,
            headers: await getHeaders(headerType: headerType)),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> postRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {},
      HeaderType? headerType = HeaderType.secured}) async {
    Response response;
    const _extra = <String, dynamic>{};
    try {
      dynamic requestData = data;
      if (headerType == HeaderType.file) {
        requestData = FormData.fromMap(data);
      }

      response = await dio.post(
        urlPath,
        data: requestData,
        queryParameters: queryParam,
        options: Options(
            extra: _extra, headers: await getHeaders(headerType: headerType)),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> putRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {},
      HeaderType? headerType = HeaderType.secured}) async {
    Response response;
    const _extra = <String, dynamic>{};
    try {
      dynamic requestData = data;
      if (headerType == HeaderType.file) {
        requestData = FormData.fromMap(data);
      }

      response = await dio.put(
        urlPath,
        data: requestData,
        queryParameters: queryParam,
        options: Options(
            extra: _extra, headers: await getHeaders(headerType: headerType)),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> deleteRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {},
      HeaderType? headerType = HeaderType.secured}) async {
    Response response;
    const _extra = <String, dynamic>{};
    try {
      dynamic requestData = data;
      if (headerType == HeaderType.file) {
        requestData = FormData.fromMap(data);
      }

      response = await dio.delete(
        urlPath,
        data: requestData,
        queryParameters: queryParam,
        options: Options(
            extra: _extra, headers: await getHeaders(headerType: headerType)),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: HttpConfigs.baseUrl,
      ),
    );
  }

  Future<Map<String, dynamic>> getHeaders({HeaderType? headerType}) async {
    String? accessToken;
    bool? accessTokenExists;
    secureStorageService = getIt.getItInstance<SecureStorageService>();
    accessTokenExists =
        await secureStorageService.isExists(key: Constants.tokenKey);
    if (!accessTokenExists) {
      accessToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyNTE4MThkNjgzM2IzNTEzYTQ5MjQzZSIsImlhdCI6MTY1NTIzNTM2MSwiZXhwIjoyNTE5MTQ4OTYxfQ.Ts3NEve2zxagDz6VvERWAvGfFHQbPzFzjx3VxR0AQaM";
    } else {
      accessToken = await secureStorageService.read(key: Constants.tokenKey);
    }
    switch (headerType) {
      case HeaderType.secured:
        return {
          "Content-Type": "application/json",
          "Authorization":
              "${accessToken != null && accessToken.isNotEmpty ? accessToken : ""}"
        };
      case HeaderType.file:
        return {
          "Content-Type": "multipart/form-data",
          "Authorization":
              "${accessToken != null && accessToken.isNotEmpty ? accessToken : ""}"
        };
      case HeaderType.none:
        return {
          "Content-Type": "application/json",
        };
      default:
        return {
          "Content-Type": "application/json",
        };
    }
  }
}
