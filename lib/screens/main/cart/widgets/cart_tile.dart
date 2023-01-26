import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/providers/cart/cart_provider.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_text.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.model});

  final CartItemModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.all(10),
        height: 90,
        width: SizeConfig.w(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.kWhite,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 20,
                color: AppColors.kAsh.withOpacity(0.4)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    model.productModel.image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      model.productModel.productName,
                      fontSize: 14,
                    ),
                    Row(
                      children: [
                        InkWell(
                            child: Icon(Icons.add),
                            onTap: () => Provider.of<CartProvider>(context,
                                    listen: false)
                                .increaseCartItemCount(model.productModel)),
                        SizedBox(width: 15),
                        CustomText(
                          '${model.amount}',
                          fontSize: 14,
                        ),
                        SizedBox(width: 15),
                        InkWell(
                            child: Icon(Icons.remove),
                            onTap: () => Provider.of<CartProvider>(context,
                                    listen: false)
                                .decreaseCartItemCount(
                                    model.productModel, context)),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Provider.of<CartProvider>(context, listen: false)
                      .removeCartItem(model.productModel.productId, context),
                  child: Icon(
                    Icons.close,
                    color: AppColors.kRed,
                  ),
                ),
                CustomText(
                  'Rs. ${model.subTotal}',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ],
            )
          ],
        ));
  }
}
