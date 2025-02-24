import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';

class OrderRegistrationEntity {
  final List<CartEntity> products;
  final Timestamp createdDate;
  final double totalPrice;
  final int itemCount;
  final String userAddress;
  final String orderStatus;
  final String? id;

  OrderRegistrationEntity({
    this.id,
    required this.products,
    required this.createdDate,
    required this.totalPrice,
    required this.itemCount,
    required this.userAddress,
    required this.orderStatus,
  });

  factory OrderRegistrationEntity.fromJson(Map<String, dynamic> json) {
    return OrderRegistrationEntity(
      products: (json['products'] as List).map((product) => CartEntity.fromJson(product)).toList(),
      createdDate: json['createdDate'] as Timestamp,
      totalPrice: json['totalPrice'] as double,
      itemCount: json['itemCount'] as int,
      userAddress: json['userAddress'] as String,
      orderStatus: json['orderStatus'] as String,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((product) => product.toJson()).toList(),
      'createdDate': createdDate,
      'totalPrice': totalPrice,
      'itemCount': itemCount,
      'userAddress': userAddress,
      'orderStatus': orderStatus,
      'id': id,
    };
  }
}
