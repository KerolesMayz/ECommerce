import 'package:ecommerce_app/domain/entity/user_entity.dart';

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
