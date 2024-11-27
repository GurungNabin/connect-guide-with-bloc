import 'package:connect_guide/common/widgets/button/basic_app_button.dart';
import 'package:connect_guide/data/models/auth/signin_user_req.dart';
import 'package:connect_guide/domain/usecases/auth/signin.dart';
import 'package:connect_guide/presentation/auth/pages/signup.dart';
import 'package:connect_guide/presentation/bottom_nav_bar/pages/bottom_nav_bar.dart';
import 'package:connect_guide/service_locator.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

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
                  _passwordField(context),
                  const SizedBox(height: 20),
                  BasicAppButton(
                    onPressed: () async {
                      var result = await sl<SigninUseCase>().call(
                        params: SigninUserReq(
                          email: _emailController.text.toString(),
                          password: _passwordController.text.toString(),
                        ),
                      );
                      result.fold((ifLeft) {
                        var snacbar = SnackBar(content: Text(ifLeft));
                        ScaffoldMessenger.of(context).showSnackBar(snacbar);
                      }, (ifRight) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyBottomBar(),
                            ),
                            (route) => false);
                      });
                    },
                    title: 'Sign In',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _signupText(context),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
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

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No A Member??',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SignupPage(),
                ),
              );
            },
            child: const Text(
              'Register Now',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
