
// import 'package:connect_guide/presentation/home/bloc/business/business_cubit.dart';
// import 'package:connect_guide/presentation/home/pages/home_screen.dart';
// import 'package:connect_guide/presentation/list_screen/pages/business_list_screen.dart';
// import 'package:connect_guide/presentation/saved_screen/pages/saved_screen.dart';
// import 'package:connect_guide/presentation/search_screen/pages/search_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyBottomBarWithProvider extends StatelessWidget {
//   const MyBottomBarWithProvider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => BusinessCubit(),
//       child: const MyBottomBar(),
//     );
//   }
// }

// class MyBottomBar extends StatefulWidget {
//   const MyBottomBar({super.key, this.initialIndex = 0});

//   final int initialIndex;

//   @override
//   State<MyBottomBar> createState() => _MyBottomBarState();
// }

// class _MyBottomBarState extends State<MyBottomBar> {
//   late int _selectedIndex;
//   bool _isLoading = true; // Track if the index has finished loading

//   @override
//   void initState() {
//     super.initState();
//     _loadSelectedIndex();
//   }

//   // Load the saved index from SharedPreferences
//   _loadSelectedIndex() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _selectedIndex = prefs.getInt('selectedIndex') ?? widget.initialIndex;
//       _isLoading = false; // Set loading flag to false once the index is loaded
//     });
//   }

//   // Save the selected index to SharedPreferences
//   _saveSelectedIndex(int index) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setInt('selectedIndex', index);
//   }

//   void _navigateBottomBar(int index) {
//     _saveSelectedIndex(index); // Save the selected index
//     setState(() {
//       _selectedIndex = index; // Update the selected index
//     });
//   }

//   final List<Widget> _pages = [
//     const HomeScreen(),
//     const SavedScreen(),
//     const SearchScreen(),
//     const BusinessListScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return const Center(
//           child:
//               CircularProgressIndicator()); // Show loading indicator until index is loaded
//     }

//     double itemWidth = MediaQuery.of(context).size.width / _pages.length;

//     return Scaffold(
//       body: _pages[
//           _selectedIndex], // Display the current page based on _selectedIndex
//       bottomNavigationBar: Stack(
//         children: [
//           BottomNavigationBar(
//             currentIndex: _selectedIndex,
//             onTap: _navigateBottomBar, // Handle tab change
//             type: BottomNavigationBarType.fixed,
//             selectedItemColor: const Color(0xFF785ef6),
//             unselectedItemColor: Colors.grey,
//             items: const [
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.favorite), label: 'Saved'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.search), label: 'Search'),
//               BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
//             ],
//           ),
//           Positioned(
//             top: 0,
//             left: itemWidth * _selectedIndex + itemWidth / 2 - (itemWidth / 4),
//             child: Container(
//               width: itemWidth / 2,
//               height: 2,
//               color:
//                   const Color(0xFF785ef6), // Indicator under the selected tab
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:connect_guide/presentation/home/bloc/business/business_cubit.dart';
import 'package:connect_guide/presentation/home/pages/home_screen.dart';
import 'package:connect_guide/presentation/list_screen/pages/business_list_screen.dart';
import 'package:connect_guide/presentation/saved_screen/pages/saved_screen.dart';
import 'package:connect_guide/presentation/search_screen/pages/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBottomBarWithProvider extends StatelessWidget {
  const MyBottomBarWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BusinessCubit(),
      child: const MyBottomBar(),
    );
  }
}

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  late int _selectedIndex;
  bool _isLoading = true; // Track if the index has finished loading
  Position? _userPosition;

  @override
  void initState() {
    super.initState();
    _loadSelectedIndex();
    _getUserPosition();
  }

  // Load the saved index from SharedPreferences
  _loadSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedIndex = prefs.getInt('selectedIndex') ?? widget.initialIndex;
      _isLoading = false; // Set loading flag to false once the index is loaded
    });
  }

  // Save the selected index to SharedPreferences
  _saveSelectedIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedIndex', index);
  }

  // Get the user's current position
  Future<void> _getUserPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userPosition = position;
    });
  }

  void _navigateBottomBar(int index) {
    _saveSelectedIndex(index); // Save the selected index
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading || _userPosition == null) {
      return const Center(
          child:
              CircularProgressIndicator()); // Show loading indicator until index is loaded
    }

    final List<Widget> _pages = [
      const HomeScreen(),
      const SavedScreen(),
      SearchScreen(userPosition: _userPosition!),
      const BusinessListScreen(),
    ];

    double itemWidth = MediaQuery.of(context).size.width / _pages.length;

    return Scaffold(
      body: _pages[
          _selectedIndex], // Display the current page based on _selectedIndex
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar, // Handle tab change
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF785ef6),
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Saved'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
            ],
          ),
          Positioned(
            top: 0,
            left: itemWidth * _selectedIndex + itemWidth / 2 - (itemWidth / 4),
            child: Container(
              width: itemWidth / 2,
              height: 2,
              color:
                  const Color(0xFF785ef6), // Indicator under the selected tab
            ),
          ),
        ],
      ),
    );
  }
}