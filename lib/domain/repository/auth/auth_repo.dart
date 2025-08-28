import 'package:ecommerce_app/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';

abstract class AuthRepo {
  Future<Result<AuthEntity>> signup(String name, String email,
      String password, String rePassword, String phone);

  Future<Result<AuthEntity>> signIn(String password, String email);
}
