import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/controllers/product_controller.dart';
import 'package:grocery_app/utils/alert_helper.dart';
import 'package:logger/logger.dart';

import '../../models/objects.dart';

class ProductProvider extends ChangeNotifier {
  //A list to store product list
  List<ProductModel> _products = [];

  //Getter for product list
  List<ProductModel> get products => _products;

  //Getter for related product List
  List<ProductModel> get relatedProducts {
    List<ProductModel> relatedProducts = [];

    for (var i = 0; i < _products.length; i++) {
      if (_products[i].productId != _productModel.productId) {
        relatedProducts.add(_products[i]);
      }
    }

    return relatedProducts;
  }

  bool _isLoading = false;

  // -------- Get loading state
  bool get isLoading => _isLoading;

  // --------- Change Loading State
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //Product Controller Instance
  final ProductController _productController = ProductController();

  // Fetch products function
  Future<void> fetchProducts() async {
    try {
      setLoading(true);

      //Start fetching products
      _products = await _productController.getProducts();

      notifyListeners();

      setLoading(false);
    } catch (e) {
      Logger().e(e);
      setLoading(false);
    }
  }

  // Add to favourites
  // A list to store favourite products
  final List<ProductModel> _favProducts = [];

  //Getter for favourite products get
  List<ProductModel> get favProducts => _favProducts;

  void initAddToFav(ProductModel model, BuildContext context) {
    //First check whether fav list already has the object
    if (_favProducts.contains(model)) {
      _favProducts.remove(model);

      // Show snack bar
      AlertHelper.showSnackBar(
          "Removed from favouites !", AnimatedSnackBarType.error, context);

      notifyListeners();
    } else {
      //adding clicked favaourite product to list
      _favProducts.add(model);

      // Show snack bar
      AlertHelper.showSnackBar(
          "Added to favouites !", AnimatedSnackBarType.success, context);
      notifyListeners();
    }
  }

  //---------------- Product Details Screen
  //To store the selected product Model
  late ProductModel _productModel;

  //Get The selected model
  ProductModel get productModel => _productModel;

  //Set Product model when clicked on the product card
  void setProduct(ProductModel model) {
    _productModel = model;
    notifyListeners();
  }
}
