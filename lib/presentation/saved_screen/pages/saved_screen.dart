import 'dart:convert';

import 'package:connect_guide/presentation/home/widgets/custom_card_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<Map<String, dynamic>> favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoritesList = prefs.getStringList('favorites') ?? [];

    setState(() {
      favorites = favoritesList
          .map((item) => json.decode(item) as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Favorites'),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites saved yet'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final business = favorites[index];
                // return ListTile(
                //   title: Text(
                //     business['name'],
                //     style: const TextStyle(overflow: TextOverflow.ellipsis),
                //   ),
                //   subtitle: Text(
                //     business['address'],
                //     style: const TextStyle(overflow: TextOverflow.ellipsis),
                //   ),
                //   leading: business['photos'] != null
                //       ? Image.network(
                //           business['photos'][0],
                //           width: 100,
                //           height: 100,
                //           errorBuilder: (context, error, stackTrace) =>
                //               const Icon(Icons.error, size: 100),
                //         )
                //       : Image.asset('assets/images/company.jpg',
                //           width: 100, height: 100),
                //   trailing: IconButton(
                //     icon: const Icon(Icons.delete),
                //     onPressed: () async {
                //       final prefs = await SharedPreferences.getInstance();
                //       List<String> updatedFavorites = List.from(
                //           favorites.map((business) => jsonEncode(business)));
                //       updatedFavorites.removeAt(index);
                //       prefs.setStringList('favorites', updatedFavorites);

                //       setState(() {
                //         favorites.removeAt(index);
                //       });
                //     },
                //   ),
                //   onTap: () {
                //     // You can navigate to a detailed view of the business
                //     // e.g., Navigator.push(...)
                //   },
                // );
                return CustomInfoCardList(
                  title: business['name'],
                  name: business['name'],
                  address: business['address'],
                  distance: business['distance'],
                  time: business['time'],
                  rating: business['rating'].toString(),
                  imageUrl: business['photos'] != null
                      ? business['photos'][0]
                      : 'assets/images/company.jpg',
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    List<String> updatedFavorites = List.from(
                        favorites.map((business) => jsonEncode(business)));
                    updatedFavorites.removeAt(index);
                    prefs.setStringList('favorites', updatedFavorites);

                    setState(() {
                      favorites.removeAt(index);
                    });
                  },
                );
              },
            ),
    );
  }
}
