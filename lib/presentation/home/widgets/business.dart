// import 'dart:math';

// import 'package:connect_guide/common/widgets/tab/details.dart';
// import 'package:connect_guide/common/widgets/tab/overview.dart';
// import 'package:connect_guide/common/widgets/tab/rating&review.dart';
// import 'package:connect_guide/domain/entities/business/business.dart';
// import 'package:connect_guide/domain/entities/review.dart';
// import 'package:connect_guide/presentation/home/bloc/business/business_cubit.dart';
// import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
// import 'package:connect_guide/presentation/home/widgets/custom_card_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';

// class NewBusiness extends StatefulWidget {
//   final Position userPosition;

//   const NewBusiness({super.key, required this.userPosition});

//   @override
//   State<NewBusiness> createState() => _NewBusinessState();
// }

// class _NewBusinessState extends State<NewBusiness> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<BusinessCubit>(
//       create: (_) => BusinessCubit()..getBusiness(widget.userPosition),
//       child: BlocBuilder<BusinessCubit, BusinessState>(
//         builder: (context, state) {
//           if (state is BusinessLoading) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//               ),
//             );
//           }
//           if (state is BusinessLoaded) {
//             if (state.businessList.isEmpty) {
//               return const Center(child: Text('No businesses found'));
//             }
//             print('Business data loaded: ${state.businessList}');
//             return SingleChildScrollView(child: _business(state.businessList));
//           }
//           if (state is BusinessLoadFailure) {
//             return Center(child: Text('Error: ${state.runtimeType}'));
//           }
//           return const Center(child: Text('Unknown state'));
//         },
//       ),
//     );
//   }

//   // Widget _business(List<ResultEntity> businessList) {
//   //   print('Displaying businesses: $businessList');
//   //   // Shuffle the businessList
//   //   businessList.shuffle(Random());
//   //   return ListView.separated(
//   //     physics: const NeverScrollableScrollPhysics(),
//   //     shrinkWrap: true,
//   //     itemBuilder: (context, index) {
//   //       final business = businessList[index];

//   //       return Column(
//   //         children: [
//   //           ...business.college
//   //               .map((college) => _buildBusinessCard(college, context)),
//   //           ...business.hospital
//   //               .map((hospital) => _buildBusinessCard(hospital, context)),
//   //           ...business.hotel
//   //               .map((hotel) => _buildBusinessCard(hotel, context)),
//   //           ...business.restaurants
//   //               .map((restaurant) => _buildBusinessCard(restaurant, context)),
//   //         ],
//   //       );
//   //     },
//   //     separatorBuilder: (context, index) {
//   //       return const SizedBox(width: 8.0);
//   //     },
//   //     itemCount: businessList.length,
//   //   );
//   // }

//   Widget _business(List<ResultEntity> businessList) {
//     print('Displaying businesses: $businessList');

//     // Flatten the businessList into a single list of businesses
//     List<dynamic> allBusinesses = [];
//     for (var business in businessList) {
//       allBusinesses.addAll(business.college);
//       allBusinesses.addAll(business.hospital);
//       allBusinesses.addAll(business.hotel);
//       allBusinesses.addAll(business.restaurants);
//     }

//     // Shuffle the flattened list
//     allBusinesses.shuffle(Random());

//     return ListView.separated(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         final business = allBusinesses[index];
//         return _buildBusinessCard(business, context);
//       },
//       separatorBuilder: (context, index) {
//         return const SizedBox(width: 8.0);
//       },
//       itemCount: allBusinesses.length,
//     );
//   }

//   Widget _buildBusinessCard(dynamic business, BuildContext context) {
//     final imageUrl = business.photos.isNotEmpty ? business.photos[0] : null;

//     String title;
//     String address;
//     String distance;
//     String time;
//     double rating;

//     // Assuming userPosition is available in the class
//     final double userLatitude = widget.userPosition.latitude;
//     final double userLongitude = widget.userPosition.longitude;

//     if (business is CollegeEntity) {
//       title = 'College';
//       address = business.fullAddress;
//       distance = _calculateDistance(userLatitude, userLongitude,
//           business.latitude.toDouble(), business.longitude.toDouble());
//       time = _getBusinessHoursForToday(business);
//       rating = double.tryParse(business.rating.toString()) ?? 0.0;
//     } else if (business is HospitalEntity) {
//       title = 'Hospital';
//       address = business.fullAddress;
//       distance = _calculateDistance(userLatitude, userLongitude,
//           business.latitude.toDouble(), business.longitude.toDouble());
//       time = _getBusinessHoursForToday(business);
//       rating = double.tryParse(business.rating.toString()) ?? 0.0;
//     } else if (business is HotelEntity) {
//       title = 'Hotel';
//       address = business.fullAddress;
//       distance = _calculateDistance(userLatitude, userLongitude,
//           business.latitude.toDouble(), business.longitude.toDouble());
//       time = _getBusinessHoursForToday(business);
//       rating = double.tryParse(business.rating.toString()) ?? 0.0;
//     } else if (business is RestaurantEntity) {
//       title = 'Restaurant';
//       address = business.fullAddress;
//       distance = _calculateDistance(userLatitude, userLongitude,
//           business.latitude.toDouble(), business.longitude.toDouble());
//       time = _getBusinessHoursForToday(business);
//       rating = double.tryParse(business.rating.toString()) ?? 0.0;
//     } else {
//       title = 'Business';
//       address = 'N/A';
//       distance = 'N/A';
//       time = 'N/A';
//       rating = 0.0;
//     }

//     // List<ReviewEntity> getReviews(dynamic business) {
//     //   if (business is CollegeEntity && business.reviewCount != null) {
//     //     return business.reviewCount.cast<ReviewEntity>();
//     //   } else if (business is HotelEntity && business.reviewCount != null) {
//     //     return business.reviewCount.cast<ReviewEntity>();
//     //   } else if (business is HospitalEntity && business.reviewCount != null) {
//     //     return business.reviewCount.cast<ReviewEntity>();
//     //   } else if (business is RestaurantEntity && business.reviewCount != null) {
//     //     return business.reviewCount.cast<ReviewEntity>();
//     //   } else {
//     //     return [];
//     //   }
//     // }

//     List<ReviewEntity> getReviews(dynamic business) {
//       // Since reviews are not directly part of the entities, return an empty list
//       return [];
//     }

//     return CustomInfoCardList(
//       title: title,
//       name: business.name,
//       address: address,
//       distance: distance,
//       time: time,
//       rating: rating.toString(),
//       imageUrl: imageUrl,
//       onTap: () {
//         showCustomBottomSheet(
//           context: context,
//           initialTabIndex: 0,
//           heightFactor: 0.8,
//           tabBarViews: [
//             OverView(
//               business: business,
//               onFavoriteStatusChanged: () {
//                 // Handle favorite status change
//               },
//             ),
//             RatingAndReviewTab(
//               reviews: getReviews(business),
//             ),
//             Details(
//               business: business,
//             ),
//           ],
//         );
//       },
//     );
//   }

//   String _getBusinessHoursForToday(dynamic business) {
//     final now = DateTime.now();
//     final dayOfWeek = now.weekday;

//     switch (dayOfWeek) {
//       case DateTime.monday:
//         return business.monday ?? 'Closed';
//       case DateTime.tuesday:
//         return business.tuesday ?? 'Closed';
//       case DateTime.wednesday:
//         return business.wednesday ?? 'Closed';
//       case DateTime.thursday:
//         return business.thursday ?? 'Closed';
//       case DateTime.friday:
//         return business.friday ?? 'Closed';
//       case DateTime.saturday:
//         return business.saturday ?? 'Closed';
//       case DateTime.sunday:
//         return business.sunday ?? 'Closed';
//       default:
//         return 'Closed';
//     }
//   }

//   String _calculateDistance(double startLatitude, double startLongitude,
//       double endLatitude, double endLongitude) {
//     final distanceInMeters = Geolocator.distanceBetween(
//         startLatitude, startLongitude, endLatitude, endLongitude);
//     return '${(distanceInMeters / 1000).toStringAsFixed(2)} km';
//   }

//   void showCustomBottomSheet({
//     required BuildContext context,
//     int initialTabIndex = 0,
//     required List<Widget> tabBarViews,
//     double? heightFactor,
//   }) {
//     showModalBottomSheet(
//       backgroundColor: Colors.white,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//       ),
//       context: context,
//       builder: (context) {
//         double screenHeight = MediaQuery.of(context).size.height;
//         double bottomSheetHeight = heightFactor != null
//             ? screenHeight * heightFactor
//             : screenHeight / 2;

//         return SizedBox(
//           height: bottomSheetHeight,
//           child: DefaultTabController(
//             length: tabBarViews.length,
//             initialIndex: initialTabIndex,
//             child: Column(
//               children: [
//                 // TabBar(
//                 //   tabs: List.generate(
//                 //     tabBarViews.length,
//                 //     (index) => Tab(text: 'Tab ${index + 1}'),
//                 //   ),
//                 // ),
//                 const TabBar(
//                   tabs: <Widget>[
//                     Tab(text: 'Overview'),
//                     Tab(text: 'Rating & Review'),
//                     Tab(text: 'Details'),
//                   ],
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     children: tabBarViews,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }



// latitude and longitude
import 'dart:math';
import 'package:connect_guide/common/widgets/tab/details.dart';
import 'package:connect_guide/common/widgets/tab/overview.dart';
import 'package:connect_guide/common/widgets/tab/rating&review.dart';
import 'package:connect_guide/domain/entities/business/business.dart';
import 'package:connect_guide/domain/entities/review.dart';
import 'package:connect_guide/presentation/home/bloc/business/business_cubit.dart';
import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
import 'package:connect_guide/presentation/home/widgets/custom_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class NewBusiness extends StatefulWidget {
  final Position userPosition;

  const NewBusiness({super.key, required this.userPosition});

  @override
  State<NewBusiness> createState() => _NewBusinessState();
}

class _NewBusinessState extends State<NewBusiness> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BusinessCubit>(
      create: (_) => BusinessCubit()..getBusiness(widget.userPosition),
      child: BlocBuilder<BusinessCubit, BusinessState>(
        builder: (context, state) {
          if (state is BusinessLoading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          }
          if (state is BusinessLoaded) {
            if (state.businessList.isEmpty) {
              return const Center(child: Text('No businesses found'));
            }
            print('Business data loaded: ${state.businessList}');
            return SingleChildScrollView(child: _business(state.businessList));
          }
          if (state is BusinessLoadFailure) {
            return Center(child: Text('Error: ${state.runtimeType}'));
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }

  Widget _business(List<ResultEntity> businessList) {
    print('Displaying businesses: $businessList');

    // Flatten the businessList into a single list of businesses
    List<dynamic> allBusinesses = [];
    for (var business in businessList) {
      allBusinesses.addAll(business.college);
      allBusinesses.addAll(business.hospital);
      allBusinesses.addAll(business.hotel);
      allBusinesses.addAll(business.restaurants);
    }

    // Shuffle the flattened list
    allBusinesses.shuffle(Random());

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final business = allBusinesses[index];
        return _buildBusinessCard(business, context);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 8.0);
      },
      itemCount: allBusinesses.length,
    );
  }

  Widget _buildBusinessCard(dynamic business, BuildContext context) {
    final imageUrl = business.photos.isNotEmpty ? business.photos[0] : null;

    String title;
    String address;
    String distance;
    String time;
    double rating;

    // Assuming userPosition is available in the class
    final double userLatitude = widget.userPosition.latitude;
    final double userLongitude = widget.userPosition.longitude;

    if (business is CollegeEntity) {
      title = 'College';
      address = business.fullAddress;
      distance = _calculateDistance(userLatitude, userLongitude,
          business.latitude.toDouble(), business.longitude.toDouble());
      time = _getBusinessHoursForToday(business);
      rating = double.tryParse(business.rating.toString()) ?? 0.0;
    } else if (business is HospitalEntity) {
      title = 'Hospital';
      address = business.fullAddress;
      distance = _calculateDistance(userLatitude, userLongitude,
          business.latitude.toDouble(), business.longitude.toDouble());
      time = _getBusinessHoursForToday(business);
      rating = double.tryParse(business.rating.toString()) ?? 0.0;
    } else if (business is HotelEntity) {
      title = 'Hotel';
      address = business.fullAddress;
      distance = _calculateDistance(userLatitude, userLongitude,
          business.latitude.toDouble(), business.longitude.toDouble());
      time = _getBusinessHoursForToday(business);
      rating = double.tryParse(business.rating.toString()) ?? 0.0;
    } else if (business is RestaurantEntity) {
      title = 'Restaurant';
      address = business.fullAddress;
      distance = _calculateDistance(userLatitude, userLongitude,
          business.latitude.toDouble(), business.longitude.toDouble());
      time = _getBusinessHoursForToday(business);
      rating = double.tryParse(business.rating.toString()) ?? 0.0;
    } else {
      title = 'Business';
      address = 'N/A';
      distance = 'N/A';
      time = 'N/A';
      rating = 0.0;
    }

    List<ReviewEntity> getReviews(dynamic business) {
      // Since reviews are not directly part of the entities, return an empty list
      return [];
    }

    return CustomInfoCardList(
      title: title,
      name: business.name,
      address: address,
      distance: distance,
      time: time,
      rating: rating.toString(),
      imageUrl: imageUrl,
      onTap: () {
        showCustomBottomSheet(
          context: context,
          initialTabIndex: 0,
          heightFactor: 0.8,
          tabBarViews: [
            OverView(
              business: business,
              onFavoriteStatusChanged: () {
                // Handle favorite status change
              },
            ),
            RatingAndReviewTab(
              reviews: getReviews(business),
            ),
            Details(
              business: business,
            ),
          ],
        );
      },
    );
  }

  String _getBusinessHoursForToday(dynamic business) {
    final now = DateTime.now();
    final dayOfWeek = now.weekday;

    switch (dayOfWeek) {
      case DateTime.monday:
        return business.monday ?? 'Closed';
      case DateTime.tuesday:
        return business.tuesday ?? 'Closed';
      case DateTime.wednesday:
        return business.wednesday ?? 'Closed';
      case DateTime.thursday:
        return business.thursday ?? 'Closed';
      case DateTime.friday:
        return business.friday ?? 'Closed';
      case DateTime.saturday:
        return business.saturday ?? 'Closed';
      case DateTime.sunday:
        return business.sunday ?? 'Closed';
      default:
        return 'Closed';
    }
  }

  // String _calculateDistance(double startLatitude, double startLongitude,
  //     double endLatitude, double endLongitude) {
  //   final distanceInMeters = Geolocator.distanceBetween(
  //       startLatitude, startLongitude, endLatitude, endLongitude);
  //   return '${(distanceInMeters / 1000).toStringAsFixed(2)} km';
  // }

  String _calculateDistance(double startLatitude, double startLongitude,
      double endLatitude, double endLongitude) {
    const earthRadius = 6371; 

    final dLat = _degreesToRadians(endLatitude - startLatitude);
    final dLon = _degreesToRadians(endLongitude - startLongitude);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(startLatitude)) *
            cos(_degreesToRadians(endLatitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    final distanceInKilometers = earthRadius * c;
    return '${distanceInKilometers.toStringAsFixed(2)} km';
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  void showCustomBottomSheet({
    required BuildContext context,
    int initialTabIndex = 0,
    required List<Widget> tabBarViews,
    double? heightFactor,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      context: context,
      builder: (context) {
        double screenHeight = MediaQuery.of(context).size.height;
        double bottomSheetHeight = heightFactor != null
            ? screenHeight * heightFactor
            : screenHeight / 2;

        return SizedBox(
          height: bottomSheetHeight,
          child: DefaultTabController(
            length: tabBarViews.length,
            initialIndex: initialTabIndex,
            child: Column(
              children: [
                const TabBar(
                  tabs: <Widget>[
                    Tab(text: 'Overview'),
                    Tab(text: 'Rating & Review'),
                    Tab(text: 'Details'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: tabBarViews,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
