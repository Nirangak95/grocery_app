import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/providers/auth/login_provider.dart';
import 'package:grocery_app/screens/auth/forgot_password.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import '../../components/social_button.dart';
import '../../utils/assets_constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 52),
                const CustomText(
                  'Login',
                  textAlign: TextAlign.center,
                  fontSize: 30,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 40),
                Image.asset(
                  AssetConstants.logo,
                  width: 202,
                  height: 138,
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  hintText: "Email",
                  controller:
                      Provider.of<LoginProvider>(context).emailController,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: "Password",
                  isObscure: true,
                  controller:
                      Provider.of<LoginProvider>(context).passwordController,
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () =>
                      UtilFunctions.navigateTo(context, ForgotPassword()),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      'Forgot your password ?',
                      textAlign: TextAlign.center,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Consumer<LoginProvider>(
                  builder: (context, value, child) {
                    return CustomButton(
                      text: "Login",
                      isLoading: value.isLoading,
                      onTap: () => value.startLogin(context),
                    );
                  },
                ),
                const SizedBox(height: 24),
                const CustomText(
                  "Or login with social account",
                  fontSize: 14,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      iconPath: AssetConstants.googleIcon,
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    SocialButton(
                      iconPath: AssetConstants.fbIcon,
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
