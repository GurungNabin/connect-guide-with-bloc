class CreateUserReq {
  String fullName;
  String email;
  String password;

  CreateUserReq({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': fullName,
      'email': email,
      'password': password,
    };
  }
}