import 'package:ecommerce_app/data/data_source/remote/remote_home_tab_data_source.dart';
import 'package:ecommerce_app/domain/entity/brand_entity.dart';
import 'package:ecommerce_app/domain/entity/category_entity.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/repository/auth/home_tab_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeTabRepo)
class HomeTabRepoImpl extends HomeTabRepo {
  RemoteHomeTabDataSource remoteHomeTabDataSource;

  HomeTabRepoImpl({required this.remoteHomeTabDataSource});

  @override
  Future<Result<BrandEntity>> getBrands() async {
    return await remoteHomeTabDataSource.getBrands();
  }

  @override
  Future<Result<CategoryEntity>> getCategories() {
    return remoteHomeTabDataSource.getCategories();
  }
}
