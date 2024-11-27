// import 'package:connect_guide/domain/usecases/business/get_business.dart';
// import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
// import 'package:connect_guide/service_locator.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BusinessCubit extends Cubit<BusinessState> {
//   BusinessCubit() : super(BusinessLoading());

//   Future<void> getBusiness() async {
//     print('Fetching business data...');
//     var returnedBusiness = await sl<GetBusinessUseCase>().call();
//     print('business : $returnedBusiness');

//     returnedBusiness.fold((ifLeft) {
//       print('Failed to fetch business data: $ifLeft');
//       emit(BusinessLoadFailure());
//     }, (data) {
//       print('Business data fetched successfully');
//       emit(BusinessLoaded(businessList: data));
//     });
//   }
// }

import 'package:connect_guide/domain/entities/business/business.dart';
import 'package:connect_guide/domain/usecases/business/get_business.dart';
import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
import 'package:connect_guide/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class BusinessCubit extends Cubit<BusinessState> {
  BusinessCubit() : super(BusinessLoading());

  // Future<void> getBusiness(Position userPosition) async {
  //   print('Fetching business data...');
  //   var returnedBusiness = await sl<GetBusinessUseCase>().call();
  //   print('business : $returnedBusiness');

  //   returnedBusiness.fold((ifLeft) {
  //     print('Failed to fetch business data: $ifLeft');
  //     emit(BusinessLoadFailure());
  //   }, (data) {
  //     print('Business data fetched successfully');
  //     // Sort businesses based on distance from userPosition
  //     data.sort((a, b) {
  //       double distanceA = _calculateDistance(userPosition, a);
  //       double distanceB = _calculateDistance(userPosition, b);
  //       return distanceA.compareTo(distanceB);
  //     });
  //     print('Sorted business data: $data');
  //     emit(BusinessLoaded(businessList: data));
  //   });
  // }

  Future<void> getBusiness(Position userPosition) async {
    print('Fetching business data...');
    var returnedBusiness = await sl<GetBusinessUseCase>().call();
    print('business : $returnedBusiness');

    if (isClosed) return; // Check if the Cubit is closed before proceeding

    returnedBusiness.fold((ifLeft) {
      print('Failed to fetch business data: $ifLeft');
      if (!isClosed) emit(BusinessLoadFailure());
    }, (data) {
      print('Business data fetched successfully');
      // Sort businesses based on distance from userPosition
      data.sort((a, b) {
        double distanceA = _calculateDistance(userPosition, a);
        double distanceB = _calculateDistance(userPosition, b);
        return distanceA.compareTo(distanceB);
      });
      print('Sorted business data: $data');
      if (!isClosed) emit(BusinessLoaded(businessList: data));
    });
  }

  double _calculateDistance(Position userPosition, ResultEntity business) {
    double minDistance = double.infinity;
    for (var entity in [
      ...business.college,
      ...business.hospital,
      ...business.hotel,
      ...business.restaurants
    ]) {
      double latitude;
      double longitude;

      if (entity is CollegeEntity) {
        latitude = entity.latitude;
        longitude = entity.longitude;
      } else if (entity is HospitalEntity) {
        latitude = entity.latitude;
        longitude = entity.longitude;
      } else if (entity is HotelEntity) {
        latitude = entity.latitude;
        longitude = entity.longitude;
      } else if (entity is RestaurantEntity) {
        latitude = entity.latitude;
        longitude = entity.longitude;
      } else {
        continue;
      }

      double distance = Geolocator.distanceBetween(
        userPosition.latitude,
        userPosition.longitude,
        latitude,
        longitude,
      );
      if (distance < minDistance) {
        minDistance = distance;
      }
    }
    return minDistance;
  }
}
