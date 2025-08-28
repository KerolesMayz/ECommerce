import 'package:ecommerce_app/domain/entity/brand_entity.dart';
import 'package:ecommerce_app/domain/entity/category_entity.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';

abstract class HomeTabRepo{
  Future<Result<CategoryEntity>> getCategories();
  Future<Result<BrandEntity>> getBrands();
}