// import 'package:connect_guide/domain/entities/business/business.dart';
// import 'package:connect_guide/presentation/home/widgets/custom_card.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   double _locationRadius = 0;
//   double _rating = 0;
//   List<String> selectedCategories = [];
//   List<ResultEntity> searchResults = [];
//   bool isLoading = false;
//   bool hasError = false;
//   int favoriteCount = 0;

//   final categories = [
//     'IT Companies',
//     'Cafe',
//     'Hotel',
//     'Hospital',
//     'College',
//     'School',
//     'Government offices',
//   ];

//   Future<void> _updateFavoriteCount() async {
//     final prefs = await SharedPreferences.getInstance();
//     final keys = prefs.getKeys();
//     setState(() {
//       favoriteCount = keys.length;
//     });
//   }

//   void _onFavoriteStatusChanged() {
//     _updateFavoriteCount();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Search businesses near you',
//                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildSlider(
//                         'Location Radius (km)',
//                         _locationRadius,
//                         (value) {
//                           setState(() {
//                             _locationRadius = value;
//                           });
//                         },
//                       ),
//                       _buildSlider(
//                         'Rating',
//                         _rating,
//                         (value) {
//                           setState(() {
//                             _rating = value;
//                           });
//                         },
//                         max: 5,
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         'Categories',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                       Wrap(
//                         spacing: 8.0,
//                         children: categories.map((category) {
//                           final isSelected =
//                               selectedCategories.contains(category);
//                           return FilterChip(
//                             label: Text(category),
//                             selected: isSelected,
//                             onSelected: (selected) {
//                               setState(() {
//                                 isSelected
//                                     ? selectedCategories.remove(category)
//                                     : selectedCategories.add(category);
//                               });
//                             },
//                           );
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         'Hashtag',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                       const SizedBox(height: 10),
//                       TextField(
//                         decoration: InputDecoration(
//                           hintStyle: const TextStyle(color: Colors.grey),
//                           hintText: 'eg. #Schools',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                         ),
//                         onChanged: (value) {},
//                       ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: _searchBusinesses,
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 16.0),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           // backgroundColor: ThemeConfig.theme.primaryColor,
//                         ),
//                         child: const Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.search,
//                               color: Colors.white,
//                             ),
//                             SizedBox(width: 8),
//                             Text(
//                               'Search',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       if (isLoading) ...[
//                         const Center(child: CircularProgressIndicator()),
//                       ] else if (hasError) ...[
//                         const Center(child: Text('Error loading data.')),
//                       ] else if (searchResults.isEmpty) ...[
//                         const Center(child: Text('No businesses found.')),
//                       ] else ...[
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: searchResults.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final business = searchResults[index];
//                             return CustomInfoCard(
//                               title: business.college.isNotEmpty
//                                   ? business.college[0].types
//                                   : 'No category',
//                               name: business.college.isNotEmpty
//                                   ? business.college[0].name
//                                   : 'No name',
//                               address: business.college.isNotEmpty
//                                   ? business.college[0].fullAddress
//                                   : 'No address',
//                               distance: '3.1 km away',
//                               time: '10 am - 5 pm',
//                               rating: business.college.isNotEmpty
//                                   ? business.college[0].rating
//                                   : 0.0,
//                               onTap: () {},
//                             );
//                           },
//                         )
//                       ]
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSlider(
//     String label,
//     double value,
//     ValueChanged<double> onChanged, {
//     double max = 10,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(label, style: Theme.of(context).textTheme.bodyMedium!),
//             Container(
//               padding: const EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF1F0FD),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(
//                   '${value.toStringAsFixed(1)} ${label.contains('Rating') ? '' : 'km'}'),
//             ),
//           ],
//         ),
//         SliderTheme(
//           data: SliderTheme.of(context).copyWith(
//             // activeTrackColor: const Color(0xFF785ef6),
//             // activeTrackColor: ThemeConfig.theme.primaryColor,
//             inactiveTrackColor: const Color(0xFF785ef6).withOpacity(0.2),
//             thumbColor: const Color(0xFF785ef6),
//             overlayColor: const Color(0xFF785ef6).withAlpha(32),
//           ),
//           child: Slider(
//             value: value,
//             min: 0,
//             max: max,
//             onChanged: onChanged,
//           ),
//         ),
//       ],
//     );
//   }

//   Future<void> _searchBusinesses() async {
//     setState(() {
//       isLoading = true;
//       hasError = false;
//     });

//     void showCustomBottomSheet({
//       required BuildContext context,
//       int initialTabIndex = 0,
//       required List<Widget> tabBarViews,
//       double? heightFactor,
//     }) {
//       showModalBottomSheet(
//         backgroundColor: Colors.white,
//         isScrollControlled: true,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//         ),
//         context: context,
//         builder: (context) {
//           double screenHeight = MediaQuery.of(context).size.height;
//           double bottomSheetHeight = heightFactor != null
//               ? screenHeight * heightFactor
//               : screenHeight / 2;

//           return Container(
//             height: bottomSheetHeight,
//             padding: MediaQuery.of(context).viewInsets,
//             child: DefaultTabController(
//               length: 3,
//               initialIndex: initialTabIndex,
//               child: Column(
//                 children: <Widget>[
//                   const TabBar(
//                     labelColor: Colors.red,
//                     tabs: <Widget>[
//                       Tab(text: 'Overview'),
//                       Tab(text: 'Rating & Review'),
//                       Tab(text: 'Details'),
//                     ],
//                   ),
//                   Expanded(
//                     child: TabBarView(
//                       children: tabBarViews,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     }
//   }
// }

// import 'dart:math';

// import 'package:connect_guide/data/models/auth/user.dart';
// import 'package:connect_guide/domain/entities/business/business.dart';
// import 'package:connect_guide/presentation/home/bloc/business/business_cubit.dart';
// import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
// import 'package:connect_guide/presentation/home/widgets/custom_card_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';

// class SearchScreen extends StatefulWidget {
//   final UserModel? user;
//   final Position? userPosition;

//   const SearchScreen({super.key, this.user, required this.userPosition});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   List<ResultEntity> _filteredBusinessList = [];
//   List<ResultEntity> _allBusinessList = [];

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_onSearchChanged);
//   }

//   @override
//   void dispose() {
//     _searchController.removeListener(_onSearchChanged);
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _onSearchChanged() {
//     setState(() {
//       _filteredBusinessList = _allBusinessList
//           .where((business) =>
//               business.college.any((college) => college.name
//                   .toLowerCase()
//                   .contains(_searchController.text.toLowerCase())) ||
//               business.hospital.any((hospital) => hospital.name
//                   .toLowerCase()
//                   .contains(_searchController.text.toLowerCase())) ||
//               business.hotel.any((hotel) => hotel.name
//                   .toLowerCase()
//                   .contains(_searchController.text.toLowerCase())) ||
//               business.restaurants.any((restaurant) =>
//                   restaurant.name.toLowerCase().contains(_searchController.text.toLowerCase())))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search Businesses'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: const InputDecoration(
//                 labelText: 'Search',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: BlocProvider<BusinessCubit>(
//               create: (_) => BusinessCubit()..getBusiness(widget.userPosition!),
//               child: BlocBuilder<BusinessCubit, BusinessState>(
//                 builder: (context, state) {
//                   if (state is BusinessLoading) {
//                     return const Center(
//                       child: CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                       ),
//                     );
//                   }
//                   if (state is BusinessLoaded) {
//                     _allBusinessList = state.businessList;
//                     _filteredBusinessList = _filteredBusinessList.isEmpty
//                         ? _allBusinessList
//                         : _filteredBusinessList;
//                     if (_filteredBusinessList.isEmpty) {
//                       return const Center(child: Text('No businesses found'));
//                     }
//                     return SingleChildScrollView(
//                       child: _business(_filteredBusinessList),
//                     );
//                   }
//                   if (state is BusinessLoadFailure) {
//                     return Center(child: Text('Error: ${state.runtimeType}'));
//                   }
//                   return const Center(child: Text('Unknown state'));
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

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
//     final double userLatitude = widget.userPosition!.latitude;
//     final double userLongitude = widget.userPosition!.longitude;

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

//     return CustomInfoCardList(
//       title: title,
//       name: business.name,
//       address: address,
//       distance: distance,
//       time: time,
//       rating: rating.toString(),
//       imageUrl: imageUrl,
//       onTap: () {
//         // showCustomBottomSheet(
//         //   context: context,
//         //   initialTabIndex: 0,
//         //   heightFactor: 0.8,
//         //   tabBarViews: [
//         //     OverView(
//         //       business: business,
//         //       onFavoriteStatusChanged: () {
//         //         // Handle favorite status change
//         //       },
//         //     ),
//         //     RatingAndReviewTab(
//         //       reviews: [], // Assuming reviews are not directly part of the entities
//         //     ),
//         //     Details(
//         //       business: business,
//         //     ),
//         //   ],
//         // );
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



import 'dart:math';

import 'package:connect_guide/data/models/auth/user.dart';
import 'package:connect_guide/domain/entities/business/business.dart';
import 'package:connect_guide/presentation/home/bloc/business/business_cubit.dart';
import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
import 'package:connect_guide/presentation/home/widgets/custom_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class SearchScreen extends StatefulWidget {
  final UserModel? user;
  final Position? userPosition;

  const SearchScreen({super.key, this.user, required this.userPosition});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ResultEntity> _filteredBusinessList = [];
  List<ResultEntity> _allBusinessList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredBusinessList = _allBusinessList
          .where((business) =>
              business.college.any((college) => college.name
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase())) ||
              business.hospital.any((hospital) => hospital.name
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase())) ||
              business.hotel.any((hotel) => hotel.name
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase())) ||
              business.restaurants.any((restaurant) =>
                  restaurant.name.toLowerCase().contains(_searchController.text.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Businesses'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: BlocProvider<BusinessCubit>(
              create: (_) => BusinessCubit()..getBusiness(widget.userPosition!),
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
                    _allBusinessList = state.businessList;
                    _filteredBusinessList = _searchController.text.isEmpty
                        ? _allBusinessList
                        : _filteredBusinessList;
                    if (_filteredBusinessList.isEmpty) {
                      return const Center(child: Text('No businesses found'));
                    }
                    return SingleChildScrollView(
                      child: _business(_filteredBusinessList),
                    );
                  }
                  if (state is BusinessLoadFailure) {
                    return Center(child: Text('Error: ${state.runtimeType}'));
                  }
                  return const Center(child: Text('Unknown state'));
                },
              ),
            ),
          ),
        ],
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
    final double userLatitude = widget.userPosition!.latitude;
    final double userLongitude = widget.userPosition!.longitude;

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

    return CustomInfoCardList(
      title: title,
      name: business.name,
      address: address,
      distance: distance,
      time: time,
      rating: rating.toString(),
      imageUrl: imageUrl,
      onTap: () {
        // showCustomBottomSheet(
        //   context: context,
        //   initialTabIndex: 0,
        //   heightFactor: 0.8,
        //   tabBarViews: [
        //     OverView(
        //       business: business,
        //       onFavoriteStatusChanged: () {
        //         // Handle favorite status change
        //       },
        //     ),
        //     RatingAndReviewTab(
        //       reviews: [], // Assuming reviews are not directly part of the entities
        //     ),
        //     Details(
        //       business: business,
        //     ),
        //   ],
        // );
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

  String _calculateDistance(double startLatitude, double startLongitude,
      double endLatitude, double endLongitude) {
    final distanceInMeters = Geolocator.distanceBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);
    return '${(distanceInMeters / 1000).toStringAsFixed(2)} km';
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
