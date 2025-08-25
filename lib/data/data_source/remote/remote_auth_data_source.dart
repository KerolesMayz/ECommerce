import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/entity/auth_response.dart';

abstract class RemoteAuthDataSource{
  Future<Result<AuthResponseEntity>> signUp(String name, String email, String password, String rePassword, String phone);
  Future<Result<AuthResponseEntity>> signIn(String password, String email);
}