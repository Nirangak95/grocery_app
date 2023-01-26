// GENERATED CODE - DO NOT MODIFY BY HAND

part of objects;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['uid'] as String,
      json['name'] as String,
      json['email'] as String,
      json['img'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'img': instance.img,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productId: json['id'] as String,
      productName: json['productName'] as String,
      desc: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['imageUrl'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.productId,
      'productName': instance.productName,
      'description': instance.desc,
      'price': instance.price,
      'imageUrl': instance.image,
    };

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: json['id'] as String,
      amount: json['amount'] as int,
      subTotal: (json['subTotal'] as num).toDouble(),
      productModel:
          ProductModel.fromJson(json['productModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'subTotal': instance.subTotal,
      'productModel': instance.productModel.toJson(),
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      total: (json['total'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderStatus: json['orderStatus'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'total': instance.total,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'orderStatus': instance.orderStatus,
    };
