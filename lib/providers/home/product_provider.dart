import 'package:flutter/cupertino.dart';
import 'package:grocery_app/controllers/product_controller.dart';
import 'package:logger/logger.dart';

import '../../models/objects.dart';

class ProductProvider extends ChangeNotifier {
  //A list to store product list
  List<ProductModel> _products = [];

  //Getter for product list
  List<ProductModel> get products => _products;

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

  void initAddToFav(ProductModel model) {
    //First check whether fav list already has the object
    if (_favProducts.contains(model)) {
      _favProducts.remove(model);
      notifyListeners();
    } else {
      //adding clicked favaourite product to list
      _favProducts.add(model);
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
