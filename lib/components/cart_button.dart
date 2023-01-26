import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/providers/cart/cart_provider.dart';
import 'package:provider/provider.dart';

import '../screens/main/cart/cart.dart';
import '../utils/app_colors.dart';
import '../utils/assets_constants.dart';
import '../utils/util_functions.dart';
import 'custom_text.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        return Badge(
          badgeContent: CustomText(
            value.getCartTotalItemCount.toString(),
            color: AppColors.kWhite,
          ),
          badgeStyle: BadgeStyle(badgeColor: AppColors.primaryColor),
          child: IconButton(
              onPressed: () {
                UtilFunctions.navigateTo(context, Cart());
              },
              icon: SvgPicture.asset(AssetConstants.cartIcon)),
        );
      },
    );
  }
}
