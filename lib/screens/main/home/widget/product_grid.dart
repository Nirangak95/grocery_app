import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/providers/product/product_provider.dart';
import 'package:grocery_app/screens/main/product_details/product_details.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ProductProvider>(
        builder: (context, value, child) {
          return value.isLoading
              ? Center(child: CircularProgressIndicator())
              : GridView.builder(
                  itemCount: value.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 44,
                    crossAxisSpacing: 19,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, i) {
                    return ProductTile(
                      model: value.products[i],
                    );
                  });
        },
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.model}) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Set Selected product model before navigating to the product details screen
        Provider.of<ProductProvider>(context, listen: false).setProduct(model);

        UtilFunctions.navigateTo(context, ProductDetails());
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: NetworkImage(
                model.image,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<ProductProvider>(
              builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    value.initAddToFav(model, context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 8, right: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: value.favProducts.contains(model)
                            ? AppColors.kRed
                            : AppColors.kWhite,
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(AssetConstants.favIcon),
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9),
              height: 38,
              decoration: BoxDecoration(
                  color: AppColors.klightGreen.withOpacity(.8),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    model.productName,
                    fontSize: 15,
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    "Rs. ${model.price}",
                    fontSize: 12,
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
