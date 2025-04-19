import 'package:flutter/material.dart';
import 'package:movie/common/helper/navigation/app_navigation.dart';
import 'package:movie/core/configs/theme/app_colors.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';
import 'package:movie/data/auth/repositories/auth.dart';
import 'package:movie/data/auth/source/auth_api_service.dart';
import 'package:movie/domain/auth/auth/usercases/signup.dart';
import 'package:movie/presentation/auth/pages/signup.dart';
import 'package:reactive_button/reactive_button.dart';
import 'package:flutter/gestures.dart';
class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _singinText(),
            SizedBox(height: 20),
            _emailTextField(),
            SizedBox(height: 20),
            _passwordTextField(),
            SizedBox(height: 40),
            _signinButton(),
            SizedBox(height: 20),
            _signupText(context)
          ],
        ),
      ),
    );
  }
  Widget _singinText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
    );
  }
  Widget _emailTextField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
  Widget _passwordTextField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter your password',
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }
  Widget _signinButton() {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async {

      },
      onSuccess: () {},
      onFailure: (error) {},
    );
  }
  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
          ),
          TextSpan(
            text: 'Sign Up',
            style: const TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignupPage());
              },
          ),
        ],
      ),
    );
  }
}
