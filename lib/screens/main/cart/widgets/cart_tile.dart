import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:grocery_app/utils/size_config.dart';

import '../../../../components/custom_text.dart';

class CartTile extends StatefulWidget {
  const CartTile({super.key});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
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
                    AssetConstants.dummyImage,
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
                    const CustomText(
                      "vegetable",
                      fontSize: 14,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.add),
                        SizedBox(width: 15),
                        CustomText(
                          '1',
                          fontSize: 14,
                        ),
                        SizedBox(width: 15),
                        Icon(Icons.remove),
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
                Icon(
                  Icons.close,
                  color: AppColors.kRed,
                ),
                CustomText(
                  'Rs. 200.00',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ],
            )
          ],
        ));
  }
}
