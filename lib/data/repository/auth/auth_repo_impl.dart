import 'package:ecommerce_app/data/data_source/remote/remote_auth_data_source.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/entity/auth_response.dart';
import 'package:ecommerce_app/domain/repository/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  RemoteAuthDataSource remoteAuthDataSource;
  AuthRepoImpl({required this.remoteAuthDataSource});
  @override
  Future<Result<AuthResponseEntity>> signup(String name, String email,
      String password, String rePassword, String phone) async {
   return await remoteAuthDataSource.signUp(name, email, password, rePassword, phone);
  }

  @override
  Future<Result<AuthResponseEntity>> signIn(String password, String email)async {
    return await remoteAuthDataSource.signIn(password, email);
  }
}
