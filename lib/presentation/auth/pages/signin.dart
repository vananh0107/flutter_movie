import 'package:flutter/material.dart';
import 'package:movie/common/helper/message/display_message.dart';
import 'package:movie/common/helper/navigation/app_navigation.dart';
import 'package:movie/core/configs/theme/app_colors.dart';
import 'package:movie/data/auth/models/signin_req_params.dart';
import 'package:movie/domain/auth/auth/usercases/signin.dart';
import 'package:movie/presentation/auth/pages/signup.dart';
import 'package:movie/presentation/home/pages/home.dart';
import 'package:reactive_button/reactive_button.dart';
import 'package:flutter/gestures.dart';
import 'package:movie/service_locator.dart';
class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
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
            _signinButton(context),
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
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
  Widget _passwordTextField() {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(
        hintText: 'Enter your password',
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }
  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async => sl<SigninUserCase>().call(
        params: SigninParams(
          email: _emailCon.text,
          password: _passwordCon.text,
        )
      ),
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(
          error.toString(),
          context,
        );
      },
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
