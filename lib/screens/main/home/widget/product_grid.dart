import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import '../../../../utils/app_colors.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 44,
            crossAxisSpacing: 19,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, i) {
            return ProductTile();
          }),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: NetworkImage(
              "https://www.shutterstock.com/image-vector/pumking-isolated-vector-halloween-element-600w-1195210468.jpg",
            ),
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8, right: 8),
            padding: EdgeInsets.all(8),
            decoration:
                BoxDecoration(color: AppColors.kWhite, shape: BoxShape.circle),
            child: SvgPicture.asset(AssetConstants.favIcon),
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
                  "Tomato",
                  fontSize: 15,
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  "\$1.50",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
