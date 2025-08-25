import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/entity/signup_response_entity.dart';

abstract class RemoteAuthDataSource{
  Future<Result<SignupResponseEntity>> signUp(String name, String email, String password, String rePassword, String phone);
}