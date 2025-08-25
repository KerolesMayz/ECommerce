import 'package:ecommerce_app/domain/entity/auth_response.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';

abstract class AuthRepo {
  Future<Result<AuthResponseEntity>> signup(String name, String email,
      String password, String rePassword, String phone);

  Future<Result<AuthResponseEntity>> signIn(String password, String email);
}
