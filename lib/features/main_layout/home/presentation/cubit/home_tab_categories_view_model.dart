import 'package:ecommerce_app/domain/entity/category_entity.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/use_case/get_categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/home_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabCategoriesViewModel extends Cubit<HomeTabCategoriesState> {
  GetCategoriesUseCase getCategoriesUseCase;


  HomeTabCategoriesViewModel({required this.getCategoriesUseCase})
      : super(HomeTabCategoriesLoadingState());

  void getCategories() async {
    var result = await getCategoriesUseCase.invoke();
    switch (result) {
      case Success<CategoryEntity>():
        emit(HomeTabCategoriesSuccessState(categories: result.data.data ?? []));
      case ServerError<CategoryEntity>():
        emit(HomeTabCategoriesErrorState(message: result.message));
      case ConnectivityError<CategoryEntity>():
        emit(HomeTabCategoriesErrorState(message: result.message));
      case GeneralException<CategoryEntity>():
        emit(HomeTabCategoriesErrorState(message: result.exception.toString()));
    }
  }
}
