import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:logger/logger.dart';

class ProductController {
  //Create user collection refference
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  // ----------- Fetch Products

  Future<List<ProductModel>> getProducts() async {
    try {
      //Query for the fetching all the product list

      QuerySnapshot snapshot = await products.get();

      //Product List
      List<ProductModel> list = [];

      // Mapping fetched data to product model and store them in the product list
      for (var element in snapshot.docs) {
        //Mapping to a single Product model
        ProductModel model =
            ProductModel.fromJson(element.data() as Map<String, dynamic>);

        // Adding to the list
        list.add(model);
      }

      return list;
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }
}
