import 'package:ecommerce_app/domain/entity/brand_entity.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/repository/auth/home_tab_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  HomeTabRepo homeTabRepo;

  GetBrandsUseCase({required this.homeTabRepo});

  Future<Result<BrandEntity>> invoke() async {
    return await homeTabRepo.getBrands();
  }
}
