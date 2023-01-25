import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/components/back_btn.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/screens/main/product_details/widgets/related_product_tile.dart';
import 'package:grocery_app/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_text.dart';
import '../../../providers/product/product_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/assets_constants.dart';
import 'widgets/counter_section.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          return SizedBox(
            height: SizeConfig.h(context),
            width: SizeConfig.w(context),
            child: Stack(
              children: [
                Container(
                  height: 286,
                  width: SizeConfig.w(context),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(
                          value.productModel.image,
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: const SafeArea(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: BackBtn(),
                    ),
                  ),
                ),
                Positioned(
                  top: 256,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(29, 34, 29, 0),
                    width: SizeConfig.w(context),
                    height: SizeConfig.h(context),
                    decoration: BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.circular(34)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              value.productModel.productName,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            const CounterSection()
                          ],
                        ),
                        const SizedBox(height: 21),
                        CustomText(
                          "Rs. ${value.productModel.price}",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kAsh,
                        ),
                        const SizedBox(height: 28),
                        CustomText(
                          value.productModel.desc,
                          fontSize: 14,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 26),

                        // ----- Related Item Section
                        CustomText(
                          "Related Items",
                          fontSize: 14,
                          color: AppColors.darkGreen,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                            height: 85,
                            child: Consumer<ProductProvider>(
                              builder: (context, value, child) {
                                return ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      // Hide the selected product

                                      return RelatedProductTile(
                                          model: value.relatedProducts[index]);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: 21),
                                    itemCount: value.relatedProducts.length);
                              },
                            ))
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      text: "Add to carrt",
                      onTap: () {},
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
