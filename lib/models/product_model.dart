part of 'objects.dart';

@JsonSerializable()
class ProductModel {
  final String productId;
  final String productName;
  final String desc;
  final double price;
  final String image;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.desc,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
