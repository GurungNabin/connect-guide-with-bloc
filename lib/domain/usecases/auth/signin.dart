import 'package:connect_guide/core/usecase/usecase.dart';
import 'package:connect_guide/data/models/auth/signin_user_req.dart';
import 'package:connect_guide/domain/repository/auth/auth.dart';
import 'package:connect_guide/service_locator.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
