import 'package:flutter/material.dart';
import 'package:movie/common/helper/message/display_message.dart';
import 'package:movie/common/helper/navigation/app_navigation.dart';
import 'package:movie/core/configs/theme/app_colors.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';
import 'package:movie/domain/auth/auth/usercases/signup.dart';
import 'package:movie/presentation/auth/pages/signin.dart';
import 'package:movie/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';
import 'package:flutter/gestures.dart';
class SignupPage extends StatelessWidget {
  SignupPage({super.key});
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
            _singupText(),
            SizedBox(height: 20),
            _emailTextField(),
            SizedBox(height: 20),
            _passwordTextField(),
            SizedBox(height: 40),
            _signupButton(context),
            SizedBox(height: 20),
            _signinText(context)
          ],
        ),
      ),
    );
  }
  Widget _singupText() {
    return const Text(
      'Sign Up',
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
  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async {
        print("vo");
        await sl<SignupUserCase>().call(
          params: SignupParams(
            email: _emailCon.text,
            password: _passwordCon.text,
          ),
        );
      },
      onSuccess: () {
        AppNavigator.pushAndRemove(context, SigninPage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(
          error.toString(),
          context,
        );
      },
    );
  }
  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Do have an account? ',
          ),
          TextSpan(
            text: 'Sign In',
            style: const TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context,  SigninPage());
              },
          ),
        ],
      ),
    );
  }
}
