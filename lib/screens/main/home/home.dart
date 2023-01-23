import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/controllers/auth_controller.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import 'widget/product_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AssetConstants.menuIcon),
                  Row(
                    children: [
                      SvgPicture.asset(AssetConstants.cartIcon),
                      IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () async {
                            await AuthController().signOut();
                          }),
                    ],
                  ),
                ],
              ),
              const CustomText(
                'Vegetables',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
                fontSize: 20,
              ),
              ProductGrid()
            ],
          ),
        ),
      ),
    );
  }
}
