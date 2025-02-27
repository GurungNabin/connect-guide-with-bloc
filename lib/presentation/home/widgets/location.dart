// import 'dart:async';

// import 'package:connect_guide/common/widgets/appbar/app_bar.dart';
// import 'package:connect_guide/core/configs/constants/api_key.dart';
// import 'package:connect_guide/core/configs/theme/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class CurrentLocationMap extends StatefulWidget {
//   const CurrentLocationMap({super.key});

//   @override
//   State<CurrentLocationMap> createState() => _CurrentLocationMapState();
// }

// class _CurrentLocationMapState extends State<CurrentLocationMap> {
//   final Location _locationController = Location();

//   final Completer<GoogleMapController> _mapController =
//       Completer<GoogleMapController>();

//   final _originLatitude = 6.5212402, _originLongitude = 3.3679965;
//   final _destLatitude = 6.849660, _destLongitude = 3.648190;

//   static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
//   static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
//   LatLng? _currentP;

//   Map<PolylineId, Polyline> polylines = {};

//   @override
//   void initState() {
//     super.initState();
//     getLocationUpdates().then(
//       (_) => {
//         getPolylinePoints().then((coordinates) => {
//               generatePolyLineFromPoints(coordinates),
//             }),
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           _currentP == null
//               ? const Center(
//                   child: Text(
//                     "Loading...",
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.bold),
//                   ),
//                 )
//               : GoogleMap(
//                   onMapCreated: ((GoogleMapController controller) =>
//                       _mapController.complete(controller)),
//                   initialCameraPosition: const CameraPosition(
//                     target: _pGooglePlex,
//                     zoom: 13,
//                   ),
//                   markers: {
//                     Marker(
//                       markerId: const MarkerId("_currentLocation"),
//                       icon: BitmapDescriptor.defaultMarker,
//                       position: _currentP!,
//                     ),
//                     const Marker(
//                         markerId: MarkerId("_sourceLocation"),
//                         icon: BitmapDescriptor.defaultMarker,
//                         position: _pGooglePlex),
//                     const Marker(
//                         markerId: MarkerId("_destionationLocation"),
//                         icon: BitmapDescriptor.defaultMarker,
//                         position: _pApplePark)
//                   },
//                   polylines: Set<Polyline>.of(polylines.values),
//                 ),
//           Positioned(
//             top: 0,
//             left: 15,
//             right: 15,
//             child: Column(
//               children: [
//                 const BasicAppBar(
//                   // iconColor: Colors.white,
//                   title: Text('Map'),
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: "Search places",
//                     hintStyle: const TextStyle(color: Colors.black),
//                     filled: true,
//                     fillColor: AppColors.grey.withOpacity(0.2),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                       vertical: 15,
//                       horizontal: 20,
//                     ),
//                   ),
//                   style: const TextStyle(color: Colors.black),
//                   onChanged: (value) {
//                     if (value.isNotEmpty) {
//                     } else {
//                       setState(() {});
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _cameraToPosition(LatLng pos) async {
//     final GoogleMapController controller = await _mapController.future;
//     CameraPosition newCameraPosition = CameraPosition(
//       target: pos,
//       zoom: 13,
//     );
//     await controller.animateCamera(
//       CameraUpdate.newCameraPosition(newCameraPosition),
//     );
//   }

//   Future<void> getLocationUpdates() async {
//     bool serviceEnabled;
//     PermissionStatus permissionGranted;

//     serviceEnabled = await _locationController.serviceEnabled();
//     if (serviceEnabled) {
//       serviceEnabled = await _locationController.requestService();
//     } else {
//       return;
//     }

//     permissionGranted = await _locationController.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await _locationController.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     _locationController.onLocationChanged
//         .listen((LocationData currentLocation) {
//       if (currentLocation.latitude != null &&
//           currentLocation.longitude != null) {
//         setState(() {
//           _currentP =
//               LatLng(currentLocation.latitude!, currentLocation.longitude!);
//           _cameraToPosition(_currentP!);
//         });
//       }
//     });
//   }

//   Future<List<LatLng>> getPolylinePoints() async {
//     List<LatLng> polylineCoordinates = [];
//     PolylinePoints polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       googleApiKey: googleAPiKey,
//       request: PolylineRequest(
//         origin: PointLatLng(_originLatitude, _originLongitude),
//         destination: PointLatLng(_destLatitude, _destLongitude),
//         mode: TravelMode.driving,
//         wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
//       ),
//     );
//     if (result.points.isNotEmpty) {
//       for (var point in result.points) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       }
//     } else {
//       print(result.errorMessage);
//     }
//     return polylineCoordinates;
//   }

//   void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
//     PolylineId id = const PolylineId("poly");
//     Polyline polyline = Polyline(
//         polylineId: id,
//         color: Colors.black,
//         points: polylineCoordinates,
//         width: 8);
//     setState(() {
//       polylines[id] = polyline;
//     });
//   }
// }
