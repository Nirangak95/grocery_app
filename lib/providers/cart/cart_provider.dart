import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:grocery_app/utils/alert_helper.dart';
import 'package:logger/logger.dart';

class CartProvider extends ChangeNotifier {
  // --------------------- Product Counter State
  int _counter = 1;

  //Get Counter
  int get counter => _counter;

  //Increase Counter
  void increaseCounter() {
    _counter++;
    notifyListeners();
  }

  //Decrease Counter
  void decreaseCounter() {
    if (_counter != 1) {
      _counter--;
    }
    notifyListeners();
  }
  // ----------------------------------------------

  // --- -----------------------Add To cart feature
  List<CartItemModel> _cartItems = [];

  //Get Cart Items
  List<CartItemModel> get cartItems => _cartItems;

  //Initiate Add to cart functionality
  void addToCart(ProductModel productModel, BuildContext context) {
    //First check whether adding item is already in the cart list

    if (_cartItems.any((element) => element.id == productModel.productId)) {
      //If exists, increase the product amount of the existing cart item
      increaseCartItemCount(productModel);

      AlertHelper.showSnackBar(
          "Increased product amount !", AnimatedSnackBarType.success, context);
    } else {
      //If not existing, adding it to the cart
      _cartItems.add(
        CartItemModel(
            id: productModel.productId,
            amount: _counter,
            subTotal: _counter * productModel.price,
            productModel: productModel),
      );

      AlertHelper.showSnackBar(
          "Added to the cart !", AnimatedSnackBarType.success, context);
    }

    Logger().w(cartItems.length);

    clearCounter();
    notifyListeners();
  }

  //Calculate Sub total
  void calculateSubTotal(ProductModel model) {
    _cartItems
        .singleWhere((element) => element.id == model.productId)
        .subTotal = _cartItems
            .singleWhere((element) => element.id == model.productId)
            .amount *
        model.price;

    notifyListeners();
  }

  //Clear Counter
  void clearCounter() {
    _counter = 1;
    notifyListeners();
  }

  // -- Increase the cart item count
  void increaseCartItemCount(ProductModel model) {
    _cartItems.singleWhere((element) => element.id == model.productId).amount++;

    calculateSubTotal(model);

    notifyListeners();
  }

  // -- Increase the cart item count
  void decreaseCartItemCount(ProductModel model, BuildContext context) {
    //when 1 item count, remove the product

    if (_cartItems
            .singleWhere((element) => element.id == model.productId)
            .amount ==
        1) {
      //remove the product from the cart
      removeCartItem(model.productId, context);
    } else {
      //if the higher than 1, decreasing the amount
      _cartItems
          .singleWhere((element) => element.id == model.productId)
          .amount--;

      calculateSubTotal(model);
    }

    notifyListeners();
  }

// Remove Cart Item
  void removeCartItem(String id, BuildContext context) {
    _cartItems.removeWhere((element) => element.id == id);
    AlertHelper.showSnackBar(
        "Removed from the cart !", AnimatedSnackBarType.error, context);
    notifyListeners();
  }

  // Get Cart Items total price
  double get getCartTotal {
    double total = 0;

    // Read the cart items list and get the sum of sub total values as  the cart total and return it

    for (var i = 0; i < _cartItems.length; i++) {
      total += _cartItems[i].subTotal;
    }

    return total;
  }

  // Get Cart Items total price
  int get getCartTotalItemCount {
    int count = 0;

    // Read the cart items list and get the sum of sub total values as  the cart total and return it

    for (var i = 0; i < _cartItems.length; i++) {
      count += _cartItems[i].amount;
    }

    return count;
  }

  //Clear Cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
