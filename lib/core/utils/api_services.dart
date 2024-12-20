import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  final Dio _dio;

  final String baseurl = 'https://www.googleapis.com/books/v1/volumes?';

  ApiServices(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(
      '$baseurl$endPoint',
    );
    _dio.interceptors.add(PrettyDioLogger());
    return response.data;
  }
}
