import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:grocery_app/providers/order/order_provider.dart';
import 'package:grocery_app/providers/product/product_provider.dart';
import 'package:grocery_app/screens/main/favourites/widgets/favorite_product_tile.dart';
import 'package:grocery_app/screens/main/orders/widgets/order_tile.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
                    'Orders',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Consumer<OrderProvider>(
                    builder: (context, value, child) {
                      return value.orders.isEmpty
                          ? Center(child: CustomText("No Orders"))
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                return OrderTile(
                                  index: index + 1,
                                  model: value.orders[index],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 20),
                              itemCount: value.orders.length,
                            );
                    },
                  ),
                )

                // Consumer<ProductProvider>(
                //   builder: (context, value, child) {
                //     return value.favProducts.isEmpty
                //         ? Center(child: CustomText("No orders"))
                //         : ListView.separated(
                //             itemBuilder: (context, index) {
                //               return OrderTile(
                //                   model: value.favProducts[index]);
                //             },
                //             separatorBuilder: (context, index) =>
                //                 const SizedBox(height: 20),
                //             itemCount: value.favProducts.length);
                //   },
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
