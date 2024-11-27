import 'package:connect_guide/domain/entities/business/business.dart';
import 'package:connect_guide/presentation/home/bloc/business/business_cubit.dart';
import 'package:connect_guide/presentation/home/bloc/business/business_state.dart';
import 'package:connect_guide/presentation/list_screen/widget/buseinss_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class HospitalList extends StatelessWidget {
  final Position userPosition;

  const HospitalList({super.key, required this.userPosition});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BusinessCubit>(
      create: (_) => BusinessCubit()..getBusiness(userPosition),
      child: SizedBox(
        height: 260.0,
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
              return _business(state.businessList);
            }
            if (state is BusinessLoadFailure) {
              return Center(child: Text('Error: ${state.runtimeType}'));
            }
            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }

  Widget _business(List<ResultEntity> businessList) {
    print('Displaying businesses: $businessList');
    return ListView.builder(
      itemCount: businessList.length,
      itemBuilder: (context, index) {
        final business = businessList[index];
        return Column(
          children: [
            ...business.hospital
                .map((hospital) => _buildBusinessCard(hospital)),
          ],
        );
      },
    );
  }

  Widget _buildBusinessCard(dynamic business) {
    final imageUrl = business.photos.isNotEmpty ? business.photos[0] : null;

    String title;
    String address;
    String distance;
    String time;
    double rating;

    // Assuming userPosition is available in the class
    final double userLatitude = userPosition.latitude;
    final double userLongitude = userPosition.longitude;

    if (business is HospitalEntity) {
      title = 'Hospital';
      address = business.fullAddress;
      distance = _calculateDistance(userLatitude, userLongitude,
          business.latitude.toDouble(), business.longitude.toDouble());
      time = _getBusinessHoursForToday(business);
      rating = double.tryParse(business.rating.toString()) ?? 0.0;
    } else {
      title = 'Hospital';
      address = business.fullAddress;
      distance = _calculateDistance(userLatitude, userLongitude,
          business.latitude.toDouble(), business.longitude.toDouble());
      time = _getBusinessHoursForToday(business);
      rating = double.tryParse(business.rating.toString()) ?? 0.0;
    }

    return BusinessListCard(
      title: title,
      name: business.name,
      address: address,
      distance: distance,
      time: time,
      rating: rating.toString(),
      imageUrl: imageUrl,
      onTap: () {
        // Handle onTap event
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
}
