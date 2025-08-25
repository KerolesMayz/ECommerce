import 'package:ecommerce_app/domain/entity/user_entity.dart';

class AuthResponseEntity {
  AuthResponseEntity({
    this.message,
    this.user,
    this.token,
    this.statusMsg
  });

  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;
}
