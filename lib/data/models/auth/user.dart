import 'package:connect_guide/domain/entities/auth/user.dart';

class UserModel {
  String? fullName;
  String? email;

  UserModel({
     this.fullName,
     this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['name'];
    email = json['email'];
  }
}

extension UserModelX on UserModel {
  
  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName,
      email: email,
    );
  }
}