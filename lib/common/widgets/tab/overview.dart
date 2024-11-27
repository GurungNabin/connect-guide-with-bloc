import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class OverView extends StatefulWidget {
  final dynamic business;
  final VoidCallback onFavoriteStatusChanged;

  const OverView({
    super.key,
    required this.business,
    required this.onFavoriteStatusChanged,
  });

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final storedValue = prefs.get(widget.business.name ?? '');

    if (storedValue is String) {
      setState(() {
        isFavorite = true;
      });
    } else {
      setState(() {
        isFavorite = false;
      });
    }
  }

  // Future<void> _toggleFavorite() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     isFavorite = !isFavorite;
  //     if (isFavorite) {
  //       final data = {
  //         'title': widget.business.types ?? 'No category',
  //         'name': widget.business.name ?? 'No name',
  //         'address': widget.business.fullAddress ?? 'No address',
  //         'distance': '3.1 km away',
  //         'time': '10 am - 5 pm',
  //         'rating': widget.business.rating,
  //       };
  //       prefs.setString(widget.business.name ?? '', json.encode(data));
  //     } else {
  //       prefs.remove(widget.business.name ?? '');
  //     }
  //   });

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content:
  //           Text(isFavorite ? 'Added to Favorites' : 'Removed from Favorites'),
  //     ),
  //   );

  //   widget.onFavoriteStatusChanged();
  // }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    // final String businessKey = widget.business.name ?? '';

    setState(() {
      isFavorite = !isFavorite;

      if (isFavorite) {
        // Create a new entry to save in SharedPreferences
        final data = {
          'title': widget.business.types ?? 'No category',
          'name': widget.business.name ?? 'No name',
          'address': widget.business.fullAddress ?? 'No address',
          'distance': '3.1 km away',
          'time': '10 am - 5 pm',
          'rating': widget.business.rating,
        };

        // Get existing favorites list and add new one
        List<String> favorites = prefs.getStringList('favorites') ?? [];
        favorites.add(json.encode(data));
        prefs.setStringList('favorites', favorites);
      } else {
        // Remove the favorite from the list
        List<String> favorites = prefs.getStringList('favorites') ?? [];
        favorites.removeWhere((item) {
          final businessData = json.decode(item);
          return businessData['name'] == widget.business.name;
        });
        prefs.setStringList('favorites', favorites);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text(isFavorite ? 'Added to Favorites' : 'Removed from Favorites'),
      ),
    );

    widget.onFavoriteStatusChanged();
  }

  // Future<void> _launchURL(BuildContext context, String? url) async {
  //   if (url == null || url.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('No website available')),
  //     );
  //     return;
  //   }
  //   final Uri uri = Uri.parse(url);
  //   try {
  //     if (await canLaunchUrl(uri)) {
  //       await launchUrl(uri);
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Could not launch URL')),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Could not open the URL')),
  //     );
  //   }
  // }

  Future<void> _launchURL(BuildContext context, String? url) async {
    if (url == null || url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No website available')),
      );
      return;
    }
    final Uri uri = Uri.parse(url);
    print('Attempting to launch URL: $url');
    try {
      if (await canLaunchUrl(uri)) {
        print('Launching URL: $url');
        await launchUrl(uri,
            mode: LaunchMode.inAppBrowserView,
            browserConfiguration: const BrowserConfiguration(showTitle: true));
      } else {
        print('Could not launch URL: $url');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch URL')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the URL')),
      );
    }
  }

  Future<void> _launchInAppWithBrowserOptions(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(showTitle: true),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchPhone(String phoneNumber) async {
    if (!await launchUrl(Uri.parse('tel:$phoneNumber'))) {
      throw Exception('Could not launch phone number: $phoneNumber');
    }
  }

  Future<void> _launchURLMAP(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  // Future<void> _launchMap(String location) async {
  //   final encodedLocation = Uri.encodeComponent(location);
  //   final mapUrl =
  //       'https://www.google.com/maps/search/?api=1&query=$encodedLocation';
  //   print('Map URL: $mapUrl'); // Debugging line
  //   await _launchURL(context, mapUrl);
  // }

  Future<void> _launchMap(String location) async {
    final mapUrl = location;
    print('Map URL: $mapUrl'); // Debugging line
    await _launchURLMAP(context, mapUrl);
  }

  @override
  Widget build(BuildContext context) {
    // final photos = widget.business.photos ?? [];
    // final List<Widget> photoWidgets = photos.isNotEmpty
    //     ? photos
    //         .map<Widget>((photoUrl) => Image.network(
    //               photoUrl,
    //               fit: BoxFit.cover,
    //               width: 100,
    //               height: 100,
    //               errorBuilder: (context, error, stackTrace) =>
    //                   const Icon(Icons.error, size: 100),
    //             ))
    //         .toList()
    //     : [Image.asset('assets/images/company.jpg', width: 100, height: 100)];

    final photos = widget.business.photos ?? [];
    final List<Widget> photoWidgets = (photos is List)
        ? photos
            .map<Widget>((photoUrl) => Image.network(
                  photoUrl,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, size: 100),
                ))
            .toList()
        : [
            Image.network(
              photos,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, size: 100),
            )
          ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.business.name ?? 'No name',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(widget.business.fullAddress ?? 'No address'),
                  const SizedBox(height: 8),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     // IconButton(
                  //     //   icon: Icon(isFavorite
                  //     //       ? Icons.favorite
                  //     //       : Icons.favorite_border),
                  //     //   onPressed: _toggleFavorite,
                  //     // ),
                  //     ElevatedButton(
                  //       onPressed: () =>
                  //           _launchPhone(widget.business.phoneNumber),
                  //       child: const Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           Icon(Icons.phone),
                  //           SizedBox(width: 8),
                  //           Text('Favorite'),
                  //         ],
                  //       ),
                  //     ),
                  //     // IconButton(
                  //     //   icon: const Icon(Icons.phone),
                  //     //   onPressed: () =>
                  //     //       _launchPhone(widget.business.phoneNumber),
                  //     // ),
                  //     ElevatedButton(
                  //       onPressed: () =>
                  //           _launchURL(context, widget.business.website),
                  //       child: const Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           Icon(Icons.web),
                  //           SizedBox(width: 8),
                  //           Text('Favorite'),
                  //         ],
                  //       ),
                  //     ),
                  //     // IconButton(
                  //     //   icon: const Icon(Icons.web),
                  //     //   onPressed: () =>
                  //     //       _launchURL(context, widget.business.website),
                  //     // ),
                  //   ],
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              final phoneNumber = widget.business.phoneNumber;
                              if (phoneNumber != null &&
                                  phoneNumber.isNotEmpty) {
                                _launchPhone(phoneNumber);
                              }
                            },
                            icon: const Icon(Icons.call, size: 16),
                            label: const Text("Call",
                                style: TextStyle(fontSize: 12)),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              final siteUrl = widget.business.website;
                              final validUrl =
                                  siteUrl != null && siteUrl.isNotEmpty
                                      ? (siteUrl.startsWith('http')
                                          ? siteUrl
                                          : 'http://$siteUrl')
                                      : null;

                              _launchInAppWithBrowserOptions(
                                  Uri.parse(validUrl.toString()));
                            },
                            icon: const Icon(Icons.web, size: 16),
                            label: const Text("Website",
                                style: TextStyle(fontSize: 12)),
                          ),
                          // ElevatedButton.icon(
                          //   onPressed: () {
                          //     final location = widget.business.placeLink;
                          //     if (location != null) {
                          //       final encodedLocation =
                          //           Uri.encodeComponent(location.toString());
                          //       _launchURL(context,
                          //           'https://www.google.com/maps/search/?api=1&query=$encodedLocation');
                          //     }
                          //   },
                          //   icon: const Icon(Icons.map, size: 16),
                          //   label: const Text("Map",
                          //       style: TextStyle(fontSize: 12)),
                          // ),
                          ElevatedButton.icon(
                            onPressed: () {
                              final location = widget.business.placeLink;
                              print('Location: $location'); // Debugging line
                              if (location != null && location.isNotEmpty) {
                                _launchMap(location);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Invalid location')),
                                );
                              }
                            },
                            icon: const Icon(Icons.map, size: 16),
                            label: const Text("Map",
                                style: TextStyle(fontSize: 12)),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              final emailAddress = widget.business.email;
                              if (emailAddress != null &&
                                  emailAddress.isNotEmpty) {
                                _launchURL(context, 'mailto:$emailAddress');
                              }
                            },
                            icon: const Icon(Icons.email, size: 16),
                            label: const Text("Email",
                                style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Images',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: photoWidgets.length,
                        itemBuilder: (context, index) => photoWidgets[index],
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Notes',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'This contact address was given by Surya for me to setup a meeting with this college.',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Social Links:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.facebook,
                                  color: Colors.blue),
                              onPressed: () {
                                _launchURL(
                                    context, 'https://www.facebook.com/');
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.camera_alt,
                                  color: Colors.purple),
                              onPressed: () {
                                _launchURL(
                                    context, 'https://www.instagram.com/');
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.alternate_email,
                                  color: Colors.blue),
                              onPressed: () {
                                _launchURL(
                                    context, 'mailto:example@example.com');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Photos',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: photoWidgets,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _toggleFavorite,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  const SizedBox(width: 8),
                  const Text('Favorite'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
