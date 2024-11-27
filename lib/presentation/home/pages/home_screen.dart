// import 'package:connect_guide/data/models/auth/user.dart';
// import 'package:connect_guide/presentation/auth/pages/signin.dart';
// import 'package:connect_guide/presentation/home/bloc/location/location_cubit.dart';
// import 'package:connect_guide/presentation/home/bloc/location/location_state.dart';
// import 'package:connect_guide/presentation/home/bloc/profile/profile_info_cubit.dart';
// import 'package:connect_guide/presentation/home/bloc/profile/profile_info_state.dart';
// import 'package:connect_guide/presentation/home/widgets/business.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';

// class HomeScreen extends StatefulWidget {
//   final UserModel? user;

//   const HomeScreen({super.key, this.user});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   Future<Position> _getUserPosition() async {
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _profileInfo(context),
//             const SizedBox(height: 5),
//             _locationInfo(context),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.exit_to_app),
//             onPressed: () {
//               _showSignOutDialog(context);
//             },
//           ),
//         ],
//       ),
//       body: FutureBuilder<Position>(
//         future: _getUserPosition(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             return SingleChildScrollView(
//               child: NewBusiness(userPosition: snapshot.data!),
//             );
//           } else {
//             return const Center(child: Text('Unable to get user position'));
//           }
//         },
//       ),
//     );
//   }

//   Widget _profileInfo(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProfileInfoCubit()..getUser(),
//       child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
//         builder: (context, state) {
//           if (state is ProfileInfoLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is ProfileInfoLoaded) {
//             return Column(
//               children: [
//                 Text(
//                   state.userEntity.fullName!.toUpperCase(),
//                   style: const TextStyle(textBaseline: TextBaseline.alphabetic)
//                       .apply(),
//                 ),
//               ],
//             );
//           } else if (state is ProfileInfoError) {
//             return const Text('Error');
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }

//   Widget _locationInfo(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LocationCubit()..getCurrentLocation(),
//       child: BlocBuilder<LocationCubit, LocationState>(
//         builder: (context, state) {
//           if (state is LocationInfoLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is LocationInfoLoaded) {
//             return Column(
//               children: [
//                 Text(
//                   state.location,
//                   style: const TextStyle(
//                       fontSize: 16, overflow: TextOverflow.ellipsis),
//                 ),
//               ],
//             );
//           } else if (state is LocationInfoError) {
//             return Text(state.message);
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }

//   void _showSignOutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Sign Out'),
//           content: const Text('Are you sure you want to sign out?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Dismiss the dialog
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 // Perform sign-out logic here
//                 await FirebaseAuth.instance.signOut();
//                 Navigator.of(context).pop(); // Dismiss the dialog
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(
//                     builder: (context) => SigninPage(),
//                   ),
//                 );
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Signed out')),
//                 );
//               },
//               child: const Text('Sign Out'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


// latitude and longitude 
import 'package:connect_guide/data/models/auth/user.dart';
import 'package:connect_guide/presentation/auth/pages/signin.dart';
import 'package:connect_guide/presentation/home/bloc/location/location_cubit.dart';
import 'package:connect_guide/presentation/home/bloc/location/location_state.dart';
import 'package:connect_guide/presentation/home/bloc/profile/profile_info_cubit.dart';
import 'package:connect_guide/presentation/home/bloc/profile/profile_info_state.dart';
import 'package:connect_guide/presentation/home/widgets/business.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final UserModel? user;

  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileInfo(context),
            const SizedBox(height: 5),
            _locationInfo(context),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              _showSignOutDialog(context);
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => LocationCubit()..getCurrentLocation(),
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LocationInfoLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              );
            } else if (state is LocationInfoLoaded) {
              return SingleChildScrollView(
                child: NewBusiness(userPosition: state.position),
              );
            } else if (state is LocationInfoError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('Unable to get user position'));
            }
          },
        ),
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
        builder: (context, state) {
          if (state is ProfileInfoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileInfoLoaded) {
            return Column(
              children: [
                Text(
                  state.userEntity.fullName!.toUpperCase(),
                  style: const TextStyle(textBaseline: TextBaseline.alphabetic)
                      .apply(),
                ),
              ],
            );
          } else if (state is ProfileInfoError) {
            return const Text('Error');
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _locationInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit()..getCurrentLocation(),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is LocationInfoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LocationInfoLoaded) {
            return Column(
              children: [
                Text(
                  state.location,
                  style: const TextStyle(
                      fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
              ],
            );
          } else if (state is LocationInfoError) {
            return Text(state.message);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Perform sign-out logic here
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SigninPage(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Signed out')),
                );
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }
}