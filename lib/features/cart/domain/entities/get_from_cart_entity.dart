import 'package:cloud_firestore/cloud_firestore.dart';

class CartEntity{
  final String productId;
  final String productTitle;
  final int productSize;
  final String productColor;
  final String productImage;
  final Timestamp addToCartDate;
  final int productQuantity;
  final double totalPrice;
  final double productPrice;
  final String id;

  CartEntity({
    required this.productId,
    required this.productTitle,
    required this.productSize,
    required this.productColor,
    required this.productImage,
    required this.addToCartDate,
    required this.productQuantity,
    required this.totalPrice,
    required this.productPrice,
    required this.id,
  });
  factory CartEntity.fromJson(Map<String, dynamic> json) {
    return CartEntity(
      productId: json['productId'],
      productTitle: json['productTitle'],
      productSize: json['productSize'] ,
      productColor: json['productColor'] ,
      productImage: json['productImage'] ,
      addToCartDate: json['addToCartDate'] ,
      productQuantity: json['productQuantity'] ,
      totalPrice: json['totalPrice'] ,
      productPrice: json['productPrice'],
      id: json['id'],
    );
  }
}
