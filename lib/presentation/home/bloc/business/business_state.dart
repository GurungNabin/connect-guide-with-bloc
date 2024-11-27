import 'package:connect_guide/domain/entities/business/business.dart';

abstract class BusinessState {}

class BusinessLoading extends BusinessState {}

class BusinessLoaded extends BusinessState {
  final List<ResultEntity> businessList;

  BusinessLoaded({required this.businessList});
}

class BusinessLoadFailure extends BusinessState {}
