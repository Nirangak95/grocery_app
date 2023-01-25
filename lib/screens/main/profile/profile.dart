import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:grocery_app/screens/admin/admin.dart';
import 'package:grocery_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Consumer<UserProvider>(
        builder: (context, value, child) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Center(
                      child: CustomText(
                        'Profile',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 122),
                    value.isLoading
                        ? CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          )
                        : InkWell(
                            onTap: () => value.selectImageAndUpload(),
                            child: Image.network(
                              fit: BoxFit.cover,
                              value.userModel.img,
                              width: 200,
                              height: 200,
                            ),
                          ),
                    const SizedBox(height: 30),
                    CustomText(
                      value.userModel.name,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      value.userModel.email,
                      fontSize: 13,
                      color: AppColors.lightBlue,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomButton(
                        text: "Go to admin",
                        onTap: () {
                          UtilFunctions.navigateTo(context, Admin());
                        }),
                    const SizedBox(height: 8),
                    CustomButton(
                        text: "LogOut",
                        onTap: () {
                          UtilFunctions.navigateTo(context, Admin());
                        }),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
