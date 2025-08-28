import 'package:ecommerce_app/domain/entity/brand_entity.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/use_case/get_brands_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_tab_brands_view_model_state.dart';

@injectable
class HomeTabBrandsViewModel extends Cubit<HomeTabBrandsViewModelState> {
  GetBrandsUseCase getBrandsUseCase;

  HomeTabBrandsViewModel({required this.getBrandsUseCase})
      : super(HomeTabBrandsViewModelLoadingState());

  void getBrands() async {
    var result = await getBrandsUseCase.invoke();
    switch (result) {
      case Success<BrandEntity>():
        emit(
            HomeTabBrandsViewModelSuccessState(brands: result.data.data ?? []));
      case ServerError<BrandEntity>():
        emit(HomeTabBrandsViewModelErrorState(message: result.message));
      case ConnectivityError<BrandEntity>():
        emit(HomeTabBrandsViewModelErrorState(message: result.message));
      case GeneralException<BrandEntity>():
        emit(HomeTabBrandsViewModelErrorState(
            message: result.exception.toString()));
    }
  }
}
