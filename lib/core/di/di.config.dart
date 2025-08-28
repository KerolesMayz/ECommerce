// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_source/remote/impl/remote_auth_data_source_impl.dart'
    as _i320;
import '../../data/data_source/remote/impl/remote_home_tab_data_source_impl.dart'
    as _i274;
import '../../data/data_source/remote/remote_auth_data_source.dart' as _i53;
import '../../data/data_source/remote/remote_home_tab_data_source.dart'
    as _i673;
import '../../data/repository/auth/auth_repo_impl.dart' as _i505;
import '../../data/repository/auth/home_tab_repo_impl.dart' as _i970;
import '../../domain/repository/auth/auth_repo.dart' as _i8;
import '../../domain/repository/auth/home_tab_repo.dart' as _i719;
import '../../domain/use_case/get_brands_use_case.dart' as _i759;
import '../../domain/use_case/get_categories_use_case.dart' as _i351;
import '../../domain/use_case/signin_use_case.dart' as _i185;
import '../../domain/use_case/signup_use_case.dart' as _i363;
import '../../features/auth/cubit/sign_in_view_model.dart' as _i9;
import '../../features/auth/cubit/sign_up_view_model.dart' as _i327;
import '../../features/main_layout/home/presentation/cubit/home_tab_brands_view_model.dart'
    as _i769;
import '../../features/main_layout/home/presentation/cubit/home_tab_categories_view_model.dart'
    as _i530;
import '../api_manager/api_manager.dart' as _i266;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i266.ApiManager>(() => _i266.ApiManager());
    gh.factory<_i53.RemoteAuthDataSource>(() =>
        _i320.RemoteAuthDataSourceImpl(apiManager: gh<_i266.ApiManager>()));
    gh.factory<_i673.RemoteHomeTabDataSource>(() =>
        _i274.RemoteHomeTabDataSourceImpl(apiManager: gh<_i266.ApiManager>()));
    gh.factory<_i8.AuthRepo>(() => _i505.AuthRepoImpl(
        remoteAuthDataSource: gh<_i53.RemoteAuthDataSource>()));
    gh.factory<_i185.SignInUseCase>(
        () => _i185.SignInUseCase(authRepo: gh<_i8.AuthRepo>()));
    gh.factory<_i363.SignupUseCase>(
        () => _i363.SignupUseCase(authRepo: gh<_i8.AuthRepo>()));
    gh.factory<_i327.SignUpViewModel>(
        () => _i327.SignUpViewModel(signupUseCase: gh<_i363.SignupUseCase>()));
    gh.factory<_i719.HomeTabRepo>(() => _i970.HomeTabRepoImpl(
        remoteHomeTabDataSource: gh<_i673.RemoteHomeTabDataSource>()));
    gh.factory<_i9.SignInViewModel>(
        () => _i9.SignInViewModel(signInUseCase: gh<_i185.SignInUseCase>()));
    gh.factory<_i759.GetBrandsUseCase>(
        () => _i759.GetBrandsUseCase(homeTabRepo: gh<_i719.HomeTabRepo>()));
    gh.factory<_i351.GetCategoriesUseCase>(
        () => _i351.GetCategoriesUseCase(homeTabRepo: gh<_i719.HomeTabRepo>()));
    gh.factory<_i530.HomeTabCategoriesViewModel>(() =>
        _i530.HomeTabCategoriesViewModel(
            getCategoriesUseCase: gh<_i351.GetCategoriesUseCase>()));
    gh.factory<_i769.HomeTabBrandsViewModel>(() => _i769.HomeTabBrandsViewModel(
        getBrandsUseCase: gh<_i759.GetBrandsUseCase>()));
    return this;
  }
}
