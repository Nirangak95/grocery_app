part of 'objects.dart';

//explicitToJson => for use nested models
@JsonSerializable(explicitToJson: true)
class OrderModel {
  final String id;
  final UserModel user;
  double total;
  final List<CartItemModel> items;
  final String orderStatus;

  OrderModel({
    required this.id,
    required this.user,
    required this.total,
    required this.items,
    required this.orderStatus,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
