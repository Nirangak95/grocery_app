import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:grocery_app/providers/product/product_provider.dart';
import 'package:grocery_app/screens/admin/admin.dart';
import 'package:grocery_app/screens/main/favourites/widgets/favorite_product_tile.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Consumer<UserProvider>(
        builder: (context, value, child) {
          return SafeArea(
            child: Column(
              children: [
                const Center(
                  child: CustomText(
                    'Favorites',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(child: Consumer<ProductProvider>(
                  builder: (context, value, child) {
                    return value.favProducts.isEmpty
                        ? Center(child: CustomText("No favourite products"))
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return FavProductTile(
                                  model: value.favProducts[index]);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                            itemCount: value.favProducts.length);
                  },
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
