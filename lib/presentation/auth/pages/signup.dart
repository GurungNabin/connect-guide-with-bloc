import 'package:connect_guide/common/widgets/button/basic_app_button.dart';
import 'package:connect_guide/data/models/auth/create_user_req.dart';
import 'package:connect_guide/domain/usecases/auth/signup.dart';
import 'package:connect_guide/presentation/auth/pages/signin.dart';
import 'package:connect_guide/presentation/bottom_nav_bar/pages/bottom_nav_bar.dart';
import 'package:connect_guide/service_locator.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _registerText(),
                  const SizedBox(height: 50),
                  _fullNameField(context),
                  const SizedBox(height: 20),
                  _emailField(context),
                  const SizedBox(height: 20),
                  _passwordField(context),
                  const SizedBox(height: 20),
                  // BasicAppButton(
                  //   onPressed: () async {
                  //     var result = await sl<SignupUseCase>().call(
                  //       params: CreateUserReq(
                  //         fullName: _fullNameController.text.toString(),
                  //         email: _emailController.text.toString(),
                  //         password: _passwordController.text.toString(),
                  //       ),
                  //     );
                  //     result.fold((ifLeft) {
                  //       var snacbar = SnackBar(content: Text(ifLeft));
                  //       ScaffoldMessenger.of(context).showSnackBar(snacbar);
                  //     }, (ifRight) {
                  //       Navigator.pushAndRemoveUntil(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const MyBottomBar(),
                  //           ),
                  //           (route) => false);
                  //     });
                  //   },
                  //   title: 'Create Account',
                  // ),
                  BasicAppButton(
                    onPressed: () async {
                      // Call the signup use case with the provided user details
                      var result = await sl<SignupUseCase>().call(
                        params: CreateUserReq(
                          fullName: _fullNameController.text.toString(),
                          email: _emailController.text.toString(),
                          password: _passwordController.text.toString(),
                        ),
                      );

                      // Handle the result of the signup operation
                      result.fold(
                        (ifLeft) {
                          // If signup fails, show a SnackBar with the error message
                          var snacbar = SnackBar(content: Text(ifLeft));
                          ScaffoldMessenger.of(context).showSnackBar(snacbar);
                        },
                        (ifRight) {
                          // If signup succeeds, navigate to MyBottomBar and clear the route stack
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyBottomBar(),
                            ),
                            (route) => false,
                          );
                        },
                      );
                    },
                    title: 'Create Account',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _signinText(context),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullNameController,
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do you have an account?',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SigninPage(),
                ),
              );
            },
            child: const Text(
              'Sign in',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
