import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_text.dart';
import '../../../../models/objects.dart';
import '../../../../providers/cart/cart_provider.dart';
import '../../../../providers/product/product_provider.dart';
import '../../../../utils/app_colors.dart';

class RelatedProductTile extends StatelessWidget {
  const RelatedProductTile({Key? key, required this.model}) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Set Selected product model before navigating to the product details screen
        Provider.of<ProductProvider>(context, listen: false).setProduct(model);

        //Clear the Product Counter
        Provider.of<CartProvider>(context, listen: false).clearCounter();
      },
      child: Container(
        width: 90,
        height: 83,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: NetworkImage(
                model.image,
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              height: 24,
              decoration: BoxDecoration(
                  color: AppColors.kWhite.withOpacity(.8),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                    child: CustomText(
                      model.productName,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomText(
                    "Rs. ${model.price}",
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
