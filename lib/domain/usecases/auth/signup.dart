import 'package:connect_guide/core/usecase/usecase.dart';
import 'package:connect_guide/data/models/auth/create_user_req.dart';
import 'package:connect_guide/domain/repository/auth/auth.dart';
import 'package:connect_guide/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
