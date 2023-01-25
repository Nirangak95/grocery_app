import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/components/back_btn.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/screens/main/cart/widgets/cart_tile.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import '../../../components/custom_text.dart';
import '../../../utils/app_colors.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BackBtn(),
                CustomText(
                  'Cart',
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontSize: 25,
                ),
                Icon(
                  Icons.abc,
                  color: AppColors.kWhite,
                )
              ],
            ),
            const SizedBox(height: 28),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CartTile();
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: 10),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 290,
        color: AppColors.kWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CartAmountRow(
              name: "Item total",
              amount: "Rs. 240.00",
            ),
            CartAmountRow(
              name: "Dicount",
              amount: "Rs. 240.00",
            ),
            CartAmountRow(
              name: "Tax",
              amount: "Rs. 240.00",
            ),
            CartAmountRow(
              name: "Tax",
              amount: "Rs. 240.00",
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Total",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    "Rs. 1200.00",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Place Order",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogBoxContent();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class DialogBoxContent extends StatelessWidget {
  const DialogBoxContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 300,
                height: 333,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 20,
                          color: AppColors.kAsh.withOpacity(0.4)),
                    ],
                    color: AppColors.kWhite,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetConstants.dialogIcon),
                    const SizedBox(height: 23),
                    CustomText(
                      "Thanks for Buying \nFrom Us!",
                      fontSize: 20,
                      color: AppColors.primaryColor,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: -20,
                child: CustomButton(
                  text: "See your order",
                  onTap: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CartAmountRow extends StatelessWidget {
  const CartAmountRow({Key? key, required this.name, required this.amount})
      : super(key: key);

  final String name;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            name,
            fontSize: 14,
          ),
          CustomText(
            amount,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
