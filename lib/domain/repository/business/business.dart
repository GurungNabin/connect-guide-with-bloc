import 'package:dartz/dartz.dart';

abstract class BusinessRepository {

  Future<Either> getBusinessList();
}