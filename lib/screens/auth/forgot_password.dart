import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/screens/auth/login.dart';
import 'package:grocery_app/utils/app_colors.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import '../../utils/alert_helper.dart';
import '../../utils/assets_constants.dart';
import '../../utils/util_functions.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  bool isLoading = false;

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
                  'Forgot Password',
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
                const SizedBox(height: 100),
                const CustomText(
                  'Please, enter your email address. You will receive a link to create a new password via email.',
                  fontSize: 14,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                ),
                const SizedBox(height: 53),
                CustomButton(
                  isLoading: isLoading,
                  text: "Send Reset Email",
                  onTap: () async {
                    if (validateFields()) {
                      setState(() {
                        isLoading = true;
                      });
                      await AuthController()
                          .sendPassResetEmail(context, emailController.text);

                      emailController.clear();

                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateFields() {
    if (emailController.text.isEmpty) {
      AlertHelper.showAlert(
          context, DialogType.error, "ËRROR", "Please fill email field !");
      return false;
    } else if (!emailController.text.contains("@")) {
      AlertHelper.showAlert(
          context, DialogType.error, "ËRROR", "Please enter a valid email");
      return false;
    } else {
      return true;
    }
  }
}
