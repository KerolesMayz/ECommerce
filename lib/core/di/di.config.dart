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
import '../../data/data_source/remote/remote_auth_data_source.dart' as _i53;
import '../../data/repository/auth/auth_repo_impl.dart' as _i505;
import '../../domain/repository/auth/auth_repo.dart' as _i8;
import '../../domain/use_case/signin_use_case.dart' as _i185;
import '../../domain/use_case/signup_use_case.dart' as _i363;
import '../../features/auth/cubit/sign_in_view_model.dart' as _i9;
import '../../features/auth/cubit/sign_up_view_model.dart' as _i327;
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
    gh.factory<_i8.AuthRepo>(() => _i505.AuthRepoImpl(
        remoteAuthDataSource: gh<_i53.RemoteAuthDataSource>()));
    gh.factory<_i363.SignupUseCase>(
        () => _i363.SignupUseCase(authRepo: gh<_i8.AuthRepo>()));
    gh.factory<_i185.SignInUseCase>(
        () => _i185.SignInUseCase(authRepo: gh<_i8.AuthRepo>()));
    gh.factory<_i327.SignUpViewModel>(
        () => _i327.SignUpViewModel(signupUseCase: gh<_i363.SignupUseCase>()));
    gh.factory<_i9.SignInViewModel>(
        () => _i9.SignInViewModel(signInUseCase: gh<_i185.SignInUseCase>()));
    return this;
  }
}
