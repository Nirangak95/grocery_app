import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:grocery_app/screens/admin/admin.dart';
import 'package:grocery_app/utils/util_functions.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../../models/objects.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Container(
        child: Consumer<UserProvider>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: value.isLoading
                      ? const CircularProgressIndicator()
                      : CustomText(
                          value.userModel.name,
                          fontSize: 20,
                        ),
                ),
                CustomButton(
                    text: "Go to admin",
                    onTap: () {
                      UtilFunctions.navigateTo(context, Admin());
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}
