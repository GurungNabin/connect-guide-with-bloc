
// import 'package:connect_guide/presentation/home/bloc/location/location_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// class LocationCubit extends Cubit<LocationState> {
//   LocationCubit() : super(LocationInfoLoading());

//   Future<void> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     print('Checking if location services are enabled...');
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       emit(LocationInfoError(message: 'Location services are disabled.'));
//       print('Location services are disabled.');
//       return;
//     }

//     print('Checking location permissions...');
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         emit(LocationInfoError(message: 'Location permissions are denied'));
//         print('Location permissions are denied.');
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       emit(LocationInfoError(message: 'Location permissions are permanently denied'));
//       print('Location permissions are permanently denied.');
//       return;
//     }

//     print('Getting current position...');
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     Placemark place = placemarks[0];

//     String currentLocation =
//         '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';

//     print('Current location: $currentLocation');
//     emit(LocationInfoLoaded(location: currentLocation, position: position));
//   }
// }



// latutide and longitude 

import 'package:connect_guide/presentation/home/bloc/location/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInfoLoading());

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    print('Checking if location services are enabled...');
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(LocationInfoError(message: 'Location services are disabled.'));
      print('Location services are disabled.');
      return;
    }

    print('Checking location permissions...');
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(LocationInfoError(message: 'Location permissions are denied'));
        print('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(LocationInfoError(message: 'Location permissions are permanently denied'));
      print('Location permissions are permanently denied.');
      return;
    }

    print('Getting current position...');
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];

    String currentLocation =
        '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';

    print('Current location: $currentLocation');
    emit(LocationInfoLoaded(location: currentLocation, position: position));
  }
}