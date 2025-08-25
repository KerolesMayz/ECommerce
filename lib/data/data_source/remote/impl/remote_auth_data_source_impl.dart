import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_manager/api_endpoints.dart';
import 'package:ecommerce_app/core/api_manager/api_manager.dart';
import 'package:ecommerce_app/data/data_source/remote/remote_auth_data_source.dart';
import 'package:ecommerce_app/data/model/auth_response_data_model.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: RemoteAuthDataSource)
class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  ApiManager apiManager;

  RemoteAuthDataSourceImpl({required this.apiManager});

  @override
  Future<Result<AuthResponseDataModel>> signUp(String name, String email,
      String password, String rePassword, String phone) async
  {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        Response response =
            await apiManager.postData(endpoint: ApiEndpoints.signup, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var signupResponse =
            AuthResponseDataModel.fromJson(response.data);
        if(response.statusCode! >= 200 && response.statusCode! < 300){
          return Success(data: signupResponse);
        }else{
          return ServerError(
              code: response.statusCode.toString(),
              message: signupResponse.message ?? '');
        }
      } else {
        return ConnectivityError();
      }
    }
    on DioException catch (e) {
      return GeneralException(exception: e);
    }
  }

  @override
  Future<Result<AuthResponseDataModel>> signIn(String password, String email) async{
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        Response response =
            await apiManager.postData(endpoint: ApiEndpoints.signIn, body: {
          "email": email,
          "password": password,
        });
        var signInResponse =
        AuthResponseDataModel.fromJson(response.data);
        if(response.statusCode! >= 200 && response.statusCode! < 300){
          return Success(data: signInResponse);
        }else{
          print(response.data);
          return ServerError(
              code: response.statusCode.toString(),
              message: signInResponse.message ?? '');
        }
      } else {
        return ConnectivityError();
      }
    }
    on DioException catch (e) {
      return GeneralException(exception: e);
    }
  }
}
