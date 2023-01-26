import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:logger/logger.dart';

class OrderController {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrderData(
      UserModel user, double total, List<CartItemModel> items) async {
    String docId = orders.doc().id;

    var list = [];
    for (var i = 0; i < items.length; i++) {
      list.add(items[i].toJson());
    }

    return orders
        .add(
          {
            'id': docId,
            'user': user.toJson(),
            'total': total,
            'items': list,
            'orderStatus': 'pending'
          },
        )
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e("Failed to add user: $error"));
  }

  // ----------- Fetch ORders

  Future<List<OrderModel>> getOrders(String uid) async {
    try {
      //Query for the fetching all the order list according to the user id

      QuerySnapshot snapshot =
          await orders.where("user.uid", isEqualTo: uid).get();

      //order List
      List<OrderModel> list = [];

      // Mapping fetched data to order model and store them in the order list
      for (var element in snapshot.docs) {
        //Mapping to a single order model
        OrderModel model =
            OrderModel.fromJson(element.data() as Map<String, dynamic>);

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
