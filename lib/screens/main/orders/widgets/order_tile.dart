import 'package:flutter/material.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/providers/product/product_provider.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/size_config.dart';
import 'package:grocery_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_text.dart';
import '../../product_details/product_details.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.index, required this.model});

  final int index;

  final OrderModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Set Selected product model before navigating to the product details screen
        // Provider.of<ProductProvider>(context, listen: false).setProduct(model);

        // UtilFunctions.navigateTo(context, const ProductDetails());
      },
      child: Container(
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
                      model.items.first.productModel.image,
                      width: 70,
                      height: 70,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        "Order no $index",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        "${model.items.first.productModel.productName} x ${model.items.first.amount}",
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: CustomText(
                      model.orderStatus,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kWhite,
                    ),
                  ),
                  CustomText(
                    'Total Rs. ${model.total}',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
