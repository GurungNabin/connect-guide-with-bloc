import 'package:connect_guide/data/sources/business/business_api_service.dart';
import 'package:connect_guide/domain/repository/business/business.dart';
import 'package:connect_guide/service_locator.dart';
import 'package:dartz/dartz.dart';

class BusinessRepositoryImpl extends BusinessRepository {
  @override
  Future<Either> getBusinessList() async {
    return await sl<BusinessDataService>().getNewBusiness();
  }
}
