
import 'package:connect_guide/presentation/home/bloc/business/business_cubit.dart';
import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
import 'package:connect_guide/presentation/search_screen/bloc/search_business_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final BusinessCubit businessCubit;

  SearchCubit(this.businessCubit) : super(SearchInitial());

  void search(String query) {
    final state = businessCubit.state;

    if (state is BusinessLoaded) {
      emit(SearchInProgress());

      final businessList = state.businessList;
      final searchResults = businessList.where((business) {
        return business.college
                .any((college) => college.name.toLowerCase().contains(query)) ||
            business.hospital.any(
                (hospital) => hospital.name.toLowerCase().contains(query)) ||
            business.hotel
                .any((hotel) => hotel.name.toLowerCase().contains(query)) ||
            business.restaurants.any(
                (restaurant) => restaurant.name.toLowerCase().contains(query));
      }).toList();

      if (searchResults.isNotEmpty) {
        emit(SearchSuccess(searchResults));
      } else {
        emit(SearchFailure("No results found"));
      }
    } else {
      emit(SearchFailure("Unable to load businesses"));
    }
  }
}
