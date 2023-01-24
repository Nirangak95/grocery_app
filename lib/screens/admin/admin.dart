import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/providers/admin/admin_provider.dart';
import 'package:grocery_app/providers/auth/signup_provider.dart';
import 'package:grocery_app/screens/auth/login.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import '../../utils/assets_constants.dart';
import '../../utils/util_functions.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
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
                    'Save Product Info',
                    textAlign: TextAlign.center,
                    fontSize: 30,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 40),
                  Consumer<AdminProvider>(
                    builder: (context, value, child) {
                      return value.getImage.path == ""
                          ? IconButton(
                              onPressed: () {
                                value.selectImage();
                              },
                              icon: Icon(Icons.image))
                          : InkWell(
                              onTap: () => value.selectImage(),
                              child: Image.file(value.getImage));
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Product Name",
                    controller:
                        Provider.of<AdminProvider>(context).proNameController,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "Description",
                    controller:
                        Provider.of<AdminProvider>(context).descController,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "Price",
                    controller:
                        Provider.of<AdminProvider>(context).priceController,
                  ),
                  const SizedBox(height: 32),
                  Consumer<AdminProvider>(
                    builder: (context, value, child) {
                      return CustomButton(
                        isLoading: value.isLoading,
                        text: "Save Product Info",
                        onTap: () => value.startSaveProductInfo(context),
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
