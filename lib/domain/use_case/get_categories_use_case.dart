import 'package:ecommerce_app/domain/entity/category_entity.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/repository/auth/home_tab_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  HomeTabRepo homeTabRepo;

  GetCategoriesUseCase({required this.homeTabRepo});

  Future<Result<CategoryEntity>> invoke() async {
    return await homeTabRepo.getCategories();
  }
}
