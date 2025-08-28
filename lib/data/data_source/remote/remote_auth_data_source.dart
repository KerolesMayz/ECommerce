import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/entity/auth_entity.dart';

abstract class RemoteAuthDataSource{
  Future<Result<AuthEntity>> signUp(String name, String email, String password, String rePassword, String phone);
  Future<Result<AuthEntity>> signIn(String password, String email);
}