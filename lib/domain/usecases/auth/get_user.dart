import 'package:connect_guide/core/usecase/usecase.dart';
import 'package:connect_guide/domain/repository/auth/auth.dart';
import 'package:connect_guide/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetUserUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<AuthRepository>().getUser();
  }
}
