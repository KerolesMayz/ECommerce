part of 'home_tab_brands_view_model.dart';

sealed class HomeTabBrandsViewModelState {}

final class HomeTabBrandsViewModelLoadingState extends HomeTabBrandsViewModelState {}

final class HomeTabBrandsViewModelErrorState extends HomeTabBrandsViewModelState {
  final String message;
  HomeTabBrandsViewModelErrorState({required this.message});
}

final class HomeTabBrandsViewModelSuccessState extends HomeTabBrandsViewModelState {
  final List<BrandDataEntity> brands;
  HomeTabBrandsViewModelSuccessState({required this.brands});
}
