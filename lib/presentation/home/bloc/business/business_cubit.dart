// import 'package:connect_guide/domain/entities/business/business.dart';
// import 'package:connect_guide/domain/usecases/business/get_business.dart';
// import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
// import 'package:connect_guide/service_locator.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';

// class BusinessCubit extends Cubit<BusinessState> {
//   BusinessCubit() : super(BusinessLoading());

//   // Future<void> getBusiness(Position userPosition) async {
//   //   print('Fetching business data...');
//   //   var returnedBusiness = await sl<GetBusinessUseCase>().call();
//   //   print('business : $returnedBusiness');

//   //   returnedBusiness.fold((ifLeft) {
//   //     print('Failed to fetch business data: $ifLeft');
//   //     emit(BusinessLoadFailure());
//   //   }, (data) {
//   //     print('Business data fetched successfully');
//   //     // Sort businesses based on distance from userPosition
//   //     data.sort((a, b) {
//   //       double distanceA = _calculateDistance(userPosition, a);
//   //       double distanceB = _calculateDistance(userPosition, b);
//   //       return distanceA.compareTo(distanceB);
//   //     });
//   //     print('Sorted business data: $data');
//   //     emit(BusinessLoaded(businessList: data));
//   //   });
//   // }

//   Future<void> getBusiness(Position userPosition) async {
//     print('Fetching business data...');
//     var returnedBusiness = await sl<GetBusinessUseCase>().call();
//     print('business : $returnedBusiness');

//     if (isClosed) return; // Check if the Cubit is closed before proceeding

//     returnedBusiness.fold((ifLeft) {
//       print('Failed to fetch business data: $ifLeft');
//       if (!isClosed) emit(BusinessLoadFailure());
//     }, (data) {
//       print('Business data fetched successfully');
//       // Sort businesses based on distance from userPosition
//       data.sort((a, b) {
//         double distanceA = _calculateDistance(userPosition, a);
//         double distanceB = _calculateDistance(userPosition, b);
//         return distanceA.compareTo(distanceB);
//       });
//       print('Sorted business data: $data');
//       if (!isClosed) emit(BusinessLoaded(businessList: data));
//     });
//   }

//   double _calculateDistance(Position userPosition, ResultEntity business) {
//     double minDistance = double.infinity;
//     for (var entity in [
//       ...business.college,
//       ...business.hospital,
//       ...business.hotel,
//       ...business.restaurants
//     ]) {
//       double latitude;
//       double longitude;

//       if (entity is CollegeEntity) {
//         latitude = entity.latitude;
//         longitude = entity.longitude;
//       } else if (entity is HospitalEntity) {
//         latitude = entity.latitude;
//         longitude = entity.longitude;
//       } else if (entity is HotelEntity) {
//         latitude = entity.latitude;
//         longitude = entity.longitude;
//       } else if (entity is RestaurantEntity) {
//         latitude = entity.latitude;
//         longitude = entity.longitude;
//       } else {
//         continue;
//       }

//       double distance = Geolocator.distanceBetween(
//         userPosition.latitude,
//         userPosition.longitude,
//         latitude,
//         longitude,
//       );
//       if (distance < minDistance) {
//         minDistance = distance;
//       }
//     }
//     return minDistance;
//   }
// }

// code
// import 'dart:math';

// import 'package:connect_guide/domain/entities/business/business.dart';
// import 'package:connect_guide/domain/usecases/business/get_business.dart';
// import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
// import 'package:connect_guide/service_locator.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';

// class BusinessCubit extends Cubit<BusinessState> {
//   BusinessCubit() : super(BusinessLoading());

//   Future<void> getBusiness(Position userPosition) async {
//     print('Fetching business data...');
//     var returnedBusiness = await sl<GetBusinessUseCase>().call();
//     print('business : $returnedBusiness');

//     if (isClosed) return; // Check if the Cubit is closed before proceeding

//     returnedBusiness.fold((ifLeft) {
//       print('Failed to fetch business data: $ifLeft');
//       if (!isClosed) emit(BusinessLoadFailure());
//     }, (data) {
//       print('Business data fetched successfully');
//       // Sort businesses based on distance from userPosition
//       data.sort((a, b) {
//         double distanceA = _calculateDistance(userPosition, a);
//         double distanceB = _calculateDistance(userPosition, b);
//         return distanceA.compareTo(distanceB);
//       });
//       print('Sorted business data: $data');
//       if (!isClosed) emit(BusinessLoaded(businessList: data));
//     });
//   }

//   double _calculateDistance(Position userPosition, ResultEntity business) {
//     double minDistance = double.infinity;
//     for (var entity in [
//       ...business.college,
//       ...business.hospital,
//       ...business.hotel,
//       ...business.restaurants
//     ]) {
//       double latitude;
//       double longitude;

//       if (entity is CollegeEntity) {
//         latitude = entity.latitude;
//         longitude = entity.longitude;
//       } else if (entity is HospitalEntity) {
//         latitude = entity.latitude;
//         longitude = entity.longitude;
//       } else if (entity is HotelEntity) {
//         latitude = entity.latitude;
//         longitude = entity.longitude;
//       } else if (entity is RestaurantEntity) {
//         latitude = entity.latitude;
//         longitude = entity.longitude;
//       } else {
//         continue;
//       }

//       double distance = _haversineDistance(
//         userPosition.latitude,
//         userPosition.longitude,
//         latitude,
//         longitude,
//       );
//       if (distance < minDistance) {
//         minDistance = distance;
//       }
//     }
//     return minDistance;
//   }

//   double _haversineDistance(
//       double lat1, double lon1, double lat2, double lon2) {
//     const R = 6371; // Radius of the Earth in kilometers
//     final dLat = _deg2rad(lat2 - lat1);
//     final dLon = _deg2rad(lon2 - lon1);
//     final a = sin(dLat / 2) * sin(dLat / 2) +
//         cos(_deg2rad(lat1)) *
//             cos(_deg2rad(lat2)) *
//             sin(dLon / 2) *
//             sin(dLon / 2);
//     final c = 2 * atan2(sqrt(a), sqrt(1 - a));
//     final distance = R * c; // Distance in kilometers
//     return distance;
//   }

//   double _deg2rad(double deg) {
//     return deg * (pi / 180);
//   }
// }

// copilot

import 'dart:math';

import 'package:connect_guide/domain/entities/business/business.dart';
import 'package:connect_guide/domain/usecases/business/get_business.dart';
import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
import 'package:connect_guide/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class BusinessCubit extends Cubit<BusinessState> {
  BusinessCubit() : super(BusinessLoading());

  Future<void> getBusiness(Position userPosition,
      {String? searchQuery, double? rangeKm}) async {
    print('Fetching business data...');
    var returnedBusiness = await sl<GetBusinessUseCase>().call();
    print('business : $returnedBusiness');

    if (isClosed) return; // Check if the Cubit is closed before proceeding

    returnedBusiness.fold((ifLeft) {
      print('Failed to fetch business data: $ifLeft');
      if (!isClosed) emit(BusinessLoadFailure());
    }, (data) {
      print('Business data fetched successfully');

      // Filter businesses within range if rangeKm is provided
      if (rangeKm != null) {
        data = filterBusinessesWithinRange(
            data, userPosition.latitude, userPosition.longitude, rangeKm);
      }

      // Recommend businesses based on search query if provided
      if (searchQuery != null && searchQuery.isNotEmpty) {
        data = recommendBusinesses(data, searchQuery);
      }

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

      double distance = haversineDistance(
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

  double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371; // Radius of the Earth in kilometers
    final dLat = _deg2rad(lat2 - lat1);
    final dLon = _deg2rad(lon2 - lon1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_deg2rad(lat1)) *
            cos(_deg2rad(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    final distance = R * c; // Distance in kilometers
    return distance;
  }

  double _deg2rad(double deg) {
    return deg * (pi / 180);
  }

  List<ResultEntity> filterBusinessesWithinRange(List<ResultEntity> businesses,
      double userLat, double userLon, double rangeKm) {
    return businesses.where((business) {
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

        double distance =
            haversineDistance(userLat, userLon, latitude, longitude);
        if (distance < minDistance) {
          minDistance = distance;
        }
      }
      return minDistance <= rangeKm;
    }).toList();
  }

  List<ResultEntity> recommendBusinesses(
      List<ResultEntity> businesses, String searchQuery) {
    // Filter businesses based on search query
    List<ResultEntity> filteredBusinesses = businesses.where((business) {
      return business.college
              .any((college) => college.name.contains(searchQuery)) ||
          business.hospital
              .any((hospital) => hospital.name.contains(searchQuery)) ||
          business.hotel.any((hotel) => hotel.name.contains(searchQuery)) ||
          business.restaurants
              .any((restaurant) => restaurant.name.contains(searchQuery));
    }).toList();

    // Sort businesses based on some criteria (e.g., rating)
    filteredBusinesses.sort((a, b) {
      double ratingA = _getHighestRating(a);
      double ratingB = _getHighestRating(b);
      return ratingB.compareTo(ratingA);
    });

    return filteredBusinesses;
  }

  double _getHighestRating(ResultEntity business) {
    double highestRating = 0.0;
    for (var entity in [
      ...business.college,
      ...business.hospital,
      ...business.hotel,
      ...business.restaurants
    ]) {
      double rating;
      if (entity is CollegeEntity) {
        rating = entity.rating.toDouble();
      } else if (entity is HospitalEntity) {
        rating = entity.rating.toDouble();
      } else if (entity is HotelEntity) {
        rating = entity.rating.toDouble();
      } else if (entity is RestaurantEntity) {
        rating = entity.rating.toDouble();
      } else {
        continue;
      }
      if (rating > highestRating) {
        highestRating = rating;
      }
    }
    return highestRating;
  }
}
