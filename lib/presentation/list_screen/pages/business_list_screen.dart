import 'package:connect_guide/presentation/list_screen/widget/college_list.dart';
import 'package:connect_guide/presentation/list_screen/widget/hospital_list.dart';
import 'package:connect_guide/presentation/list_screen/widget/hotel_list.dart';
import 'package:connect_guide/presentation/list_screen/widget/restaurant_list.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class BusinessListScreen extends StatefulWidget {
  const BusinessListScreen({super.key});

  @override
  State<BusinessListScreen> createState() => _BusinessListScreenState();
}

class _BusinessListScreenState extends State<BusinessListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Future<Position> _getUserPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Position>(
          future: _getUserPosition(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _tabs(),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        CollegeList(userPosition: snapshot.data!),
                        HotelList(userPosition: snapshot.data!),
                        HospitalList(userPosition: snapshot.data!),
                        RestaurantList(userPosition: snapshot.data!),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Unable to get user position'));
            }
          },
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      dividerColor: Colors.transparent,
      controller: _tabController,
      isScrollable: true,
      // labelColor: context.isDarkMode ? Colors.white : Colors.black,
      // indicatorColor: AppColors.primary,
      // padding: const EdgeInsets.symmetric(
      //   vertical: 20,
      // ),
      tabs: const [
        Text(
          'College',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Hotel',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Hospital',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Restaurants',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        )
      ],
    );
  }
}
