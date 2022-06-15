import 'package:dio/dio.dart';
import 'package:flutter_todo_app/service/http/http_service_impl.dart';

abstract class HttpService {
  void init();

  Future<Response> getRequest({
    required String urlPath,
    Map<String, dynamic> data = const {},
    HeaderType? headerType = HeaderType.secured,
  });

  Future<Response> postRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
    HeaderType? headerType = HeaderType.secured,
  });
  Future<Response> putRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
    HeaderType? headerType = HeaderType.secured,
  });
  Future<Response> deleteRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
    HeaderType? headerType = HeaderType.secured,
  });
}
