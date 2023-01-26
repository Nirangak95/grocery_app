part of 'objects.dart';

//explicitToJson => for use nested models
@JsonSerializable(explicitToJson: true)
class CartItemModel {
  final String id;
  int amount;
  double subTotal;
  final ProductModel productModel;

  CartItemModel({
    required this.id,
    required this.amount,
    required this.subTotal,
    required this.productModel,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
