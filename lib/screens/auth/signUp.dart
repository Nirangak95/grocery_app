import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/providers/auth/signup_provider.dart';
import 'package:grocery_app/screens/auth/login.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import '../../utils/assets_constants.dart';
import '../../utils/util_functions.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SlideInDown(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 52),
                  const CustomText(
                    'SignUp',
                    textAlign: TextAlign.center,
                    fontSize: 30,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 40),
                  SlideInDown(
                    duration: const Duration(milliseconds: 2000),
                    child: Image.asset(
                      AssetConstants.logo,
                      width: 202,
                      height: 138,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Name",
                    controller:
                        Provider.of<SignUpProvider>(context).nameController,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "Email",
                    controller:
                        Provider.of<SignUpProvider>(context).emailController,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "Password",
                    isObscure: true,
                    controller:
                        Provider.of<SignUpProvider>(context).passwordController,
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      UtilFunctions.navigateTo(context, const Login());
                    },
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                        'Already have an account ?',
                        textAlign: TextAlign.center,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Consumer<SignUpProvider>(
                    builder: (context, value, child) {
                      return CustomButton(
                        isLoading: value.isLoading,
                        text: "SignUp",
                        onTap: () => value.startSignUp(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
