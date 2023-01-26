import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/order_controller.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:grocery_app/providers/cart/cart_provider.dart';
import 'package:grocery_app/screens/main/cart/cart.dart';
import 'package:grocery_app/screens/main/main_screen.dart';
import 'package:grocery_app/utils/alert_helper.dart';
import 'package:grocery_app/utils/util_functions.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class OrderProvider extends ChangeNotifier {
  // -------Order Controller Instance
  final OrderController _orderController = OrderController();

  bool _isLoading = false;

  // -------- Get loading state
  bool get isLoading => _isLoading;

  // --------- Change Loading State
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //Start Creating the order
  Future<void> createOrder(BuildContext context) async {
    try {
      // Get the cart Items
      List<CartItemModel> items =
          Provider.of<CartProvider>(context, listen: false).cartItems;

      double cartTotal =
          Provider.of<CartProvider>(context, listen: false).getCartTotal;

      UserModel userModel =
          Provider.of<UserProvider>(context, listen: false).userModel;

      // First check whether cart item is not empty
      if (items.isNotEmpty) {
        setLoading(true);

        await _orderController
            .saveOrderData(userModel, cartTotal, items)
            .then((value) {
          setLoading(false);

          //Clear Cart
          Provider.of<CartProvider>(context, listen: false).clearCart();

          //Show the dialog box when the order is successfully created
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return DialogBoxContent(onTap: () {
                //Start fetching orders before going to order list
                fetchOrders(userModel.uid);

                UtilFunctions.navigateTo(context, MainScreen());
              });
            },
          );
        });
      } else {
        AlertHelper.showAlert(
          context,
          DialogType.error,
          "Error",
          "You must add some items to cart",
        );
      }
    } catch (e) {
      Logger().e(e);
      setLoading(false);
      AlertHelper.showSnackBar(
          e.toString(), AnimatedSnackBarType.error, context);
    }
  }

  //Fetching Orders
  List<OrderModel> _orders = [];

  //getter for order list

  List<OrderModel> get orders => _orders;

  //Start Fetching orders
  Future<void> fetchOrders(String id) async {
    try {
      setLoading(true);

      _orders = await _orderController.getOrders(id);
      notifyListeners();

      setLoading(false);
    } catch (e) {
      Logger().e(e);
      setLoading(false);
    }
  }
}
