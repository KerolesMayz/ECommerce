import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api_manager/api_endpoints.dart';
import 'package:ecommerce_app/core/api_manager/api_manager.dart';
import 'package:ecommerce_app/data/data_source/remote/remote_home_tab_data_source.dart';
import 'package:ecommerce_app/data/model/brand_response_data_model.dart';
import 'package:ecommerce_app/data/model/category_response_data_model.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteHomeTabDataSource)
class RemoteHomeTabDataSourceImpl extends RemoteHomeTabDataSource {
  ApiManager apiManager;

  RemoteHomeTabDataSourceImpl({required this.apiManager});

  @override
  Future<Result<BrandResponseDataModel>> getBrands() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    try {
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(endpoint: ApiEndpoints.brands);
        var brandsResponse = BrandResponseDataModel.fromJson(response.data);
        return response.statusCode! >= 200 && response.statusCode! < 300
            ? Success(data: brandsResponse)
            : ServerError(
                code: response.statusCode.toString(),
                message: 'Server Error 😢');
      } else {
        return ConnectivityError();
      }
    } on DioException catch (e) {
      return GeneralException(exception: e);
    }
  }

  @override
  Future<Result<CategoryResponseDataModel>> getCategories() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    try {
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
            await apiManager.getData(endpoint: ApiEndpoints.categories);
        var categoriesResponse =
            CategoryResponseDataModel.fromJson(response.data);
        return response.statusCode! >= 200 && response.statusCode! < 300
            ? Success(data: categoriesResponse)
            : ServerError(
                code: response.statusCode.toString(),
                message: 'Server Error 😢');
      } else {
        return ConnectivityError();
      }
    } on DioException catch (e) {
      return GeneralException(exception: e);
    }
  }
}
