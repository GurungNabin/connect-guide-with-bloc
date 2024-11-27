import 'package:connect_guide/core/usecase/usecase.dart';
import 'package:connect_guide/domain/repository/business/business.dart';
import 'package:connect_guide/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetBusinessUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<BusinessRepository>().getBusinessList();
  }
}
