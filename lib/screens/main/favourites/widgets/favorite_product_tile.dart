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

class FavProductTile extends StatelessWidget {
  const FavProductTile({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Set Selected product model before navigating to the product details screen
        Provider.of<ProductProvider>(context, listen: false).setProduct(model);

        UtilFunctions.navigateTo(context, const ProductDetails());
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
                      model.image,
                      width: 70,
                      height: 70,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 16),
                  CustomText(
                    model.productName,
                    fontSize: 14,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Provider.of<ProductProvider>(context, listen: false)
                          .initAddToFav(model, context);
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColors.kRed,
                    ),
                  ),
                  CustomText(
                    'Rs. ${model.price}',
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
