import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_manager/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  static final dio = Dio();

  Future<Response> getData(
      {required String endpoint, Map<String, dynamic>? queryParameters}) {
    return dio.get(ApiConstants.baseUrl + endpoint, queryParameters: queryParameters);
  }

  Future<Response> postData(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Object? body}) {
   return dio.post(ApiConstants.baseUrl + endpoint,
        queryParameters: queryParameters, data: body,
       options: Options(
         validateStatus: (status)=>true,
       )
   );
  }
}
