import 'package:ecommerce_app/data/data_source/remote/remote_auth_data_source.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/domain/repository/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  RemoteAuthDataSource remoteAuthDataSource;
  AuthRepoImpl({required this.remoteAuthDataSource});
  @override
  Future<Result<AuthEntity>> signup(String name, String email,
      String password, String rePassword, String phone) async {
   return await remoteAuthDataSource.signUp(name, email, password, rePassword, phone);
  }

  @override
  Future<Result<AuthEntity>> signIn(String password, String email)async {
    return await remoteAuthDataSource.signIn(password, email);
  }
}
