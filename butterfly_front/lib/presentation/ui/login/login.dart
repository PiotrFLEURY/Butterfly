import 'package:butterfly_front/presentation/styles/colors.dart';
import 'package:butterfly_front/presentation/ui/login/views/app_bar.dart';
import 'package:butterfly_front/presentation/ui/login/views/create_account.dart';
import 'package:butterfly_front/presentation/ui/login/views/email_field.dart';
import 'package:butterfly_front/presentation/ui/login/views/forgot_password.dart';
import 'package:butterfly_front/presentation/ui/login/views/password_field.dart';
import 'package:butterfly_front/presentation/ui/login/views/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginAppBar(),
      backgroundColor: ButterflyColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
            const SizedBox(height: 32),
            EmailField(
              hint: 'login_page_email_hint'.tr(),
            ),
            const SizedBox(height: 16),
            PasswordField(
              hint: 'login_page_password_hint'.tr(),
            ),
            const SizedBox(height: 8),
            // forgot your password link
            Align(
              alignment: Alignment.centerRight,
              child: ForgotPassword(
                text: 'login_page_forgot_password'.tr(),
                onPressed: () {
                  debugPrint('Forgot password link pressed');
                },
              ),
            ),

            const SizedBox(height: 32),
            SignInButton(
              text: 'login_page_sign_in'.tr(),
              onPressed: () {
                GoRouter.of(context).go('/contacts');
              },
            ),
            const Spacer(),
            // Get a new account link
            CreateAccount(
              text: 'login_page_create_account'.tr(),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
