import 'package:ecommerce_app/domain/entity/category_entity.dart';

sealed class HomeTabCategoriesState {}

class HomeTabCategoriesLoadingState extends HomeTabCategoriesState {}

class HomeTabCategoriesErrorState extends HomeTabCategoriesState {
  final String message;
  HomeTabCategoriesErrorState({required this.message});
}

class HomeTabCategoriesSuccessState extends HomeTabCategoriesState {
  final List<CategoryDataEntity> categories;
  HomeTabCategoriesSuccessState({required this.categories});
}