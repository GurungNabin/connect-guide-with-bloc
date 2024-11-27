import 'package:connect_guide/presentation/home/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final dynamic business; // Use dynamic to handle different business types

  const Details({
    super.key,
    required this.business,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> photos = List<String>.from(business.photos ?? []);
    final List<Widget> photoWidgets = photos.isNotEmpty
        ? photos
            .map((photoUrl) => Image.network(
                  photoUrl,
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, size: 100),
                ))
            .toList()
        : [Image.asset('assets/images/company.jpg', width: 100, height: 100)];

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomInfoCard(
              title: business.types ?? 'Category',
              name: business.name ?? 'No name',
              address: business.fullAddress ?? 'No address',
              distance: '3.1 km away',
              time: '10 am - 5 pm',
              rating: business.rating?.toString() ?? 'No rating',
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Images',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: photoWidgets,
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                business.description ?? 'No description available.',
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
