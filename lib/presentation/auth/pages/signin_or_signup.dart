// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';

// class SigninPage extends StatelessWidget {
//    SigninPage({super.key});

//   //
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   // loading time..
//   Duration get loadingTime => const Duration(milliseconds: 2000);

//   // login
//   Future<String?> _authUser(LoginData data) {
//     return Future.delayed(loadingTime).then((value) => null);
//     // return Future.value(null);
//   }

//   // forgot password
//   Future<String?> _recoverPassword(String name) {
//     return Future.delayed(loadingTime).then((value) => null);
//     // return Future.value(null);
//   }

//   // sign uo
//   Future<String?> _signupUser(SignupData data) {
//     return Future.delayed(loadingTime).then((value) => null);
//     // return Future.value(null);
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FlutterLogin(
        
//         onLogin: _authUser,
//         onRecoverPassword: _recoverPassword,
//         onSignup: _signupUser,
//         additionalSignupFields: const [
//           UserFormField(
//               keyName: 'name',
//               displayName: 'Name',
//               userType: LoginUserType.name)
//         ],
//       ),
//     );
//   }
// }


