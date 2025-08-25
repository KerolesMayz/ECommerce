import 'package:ecommerce_app/domain/entity/signup_response_entity.dart';

class SignUpResponseDataModel extends SignupResponseEntity {
  SignUpResponseDataModel({
    super.message,
    super.user,
    super.token,
    super.statusMsg,
  });

  SignUpResponseDataModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDataModel.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['message'] = message;
//   map['statusMsg'] = statusMsg;
//   if (user != null) {
//     map['user'] = user?.toJson();
//   }
//   map['token'] = token;
//   return map;
// }
}

class UserDataModel extends UserEntity {
  UserDataModel({
    super.name,
    super.email,
    this.role,
  });

  UserDataModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
