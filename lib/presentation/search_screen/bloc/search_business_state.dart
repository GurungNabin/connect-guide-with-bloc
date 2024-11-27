import 'package:connect_guide/domain/entities/business/business.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchInProgress extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ResultEntity> searchResults;

  SearchSuccess(this.searchResults);
}

class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure(this.errorMessage);
}
