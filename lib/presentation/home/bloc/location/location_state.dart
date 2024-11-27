// import 'package:geolocator/geolocator.dart';

// abstract class LocationState {}

// class LocationInfoLoading extends LocationState {}

// class LocationInfoLoaded extends LocationState {
//   final String location;
//   final Position position;

//   LocationInfoLoaded({required this.location, required this.position});
// }

// class LocationInfoError extends LocationState {
//   final String message;

//   LocationInfoError({required this.message});
// }

// longitude and latitude

import 'package:geolocator/geolocator.dart';

abstract class LocationState {}

class LocationInfoLoading extends LocationState {}

class LocationInfoLoaded extends LocationState {
  final String location;
  final Position position;

  LocationInfoLoaded({required this.location, required this.position});
}

class LocationInfoError extends LocationState {
  final String message;

  LocationInfoError({required this.message});
}
