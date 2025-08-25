import 'package:ecommerce_app/domain/entity/signup_response_entity.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';

abstract class AuthRepo {
  Future<Result<SignupResponseEntity>> signup(String name, String email,
      String password, String rePassword, String phone);
}
