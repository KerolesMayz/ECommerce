import 'package:ecommerce_app/data/model/user_data_model.dart';
import 'package:ecommerce_app/domain/entity/auth_response.dart';

class AuthResponseDataModel extends AuthResponseEntity {
  AuthResponseDataModel({
    super.message,
    super.user,
    super.token,
    super.statusMsg,
  });

  AuthResponseDataModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDataModel.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
}
