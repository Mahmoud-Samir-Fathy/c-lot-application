import 'package:cloud_firestore/cloud_firestore.dart';

class GetFromCartEntity{
  final String productId;
  final String productTitle;
  final int productSize;
  final String productColor;
  final String productImage;
  final Timestamp addToCartDate;
  final int productQuantity;
  final double totalPrice;
  final double productPrice;

  GetFromCartEntity({
    required this.productId,
    required this.productTitle,
    required this.productSize,
    required this.productColor,
    required this.productImage,
    required this.addToCartDate,
    required this.productQuantity,
    required this.totalPrice,
    required this.productPrice,
  });
  factory GetFromCartEntity.fromJson(Map<String, dynamic> json) {
    return GetFromCartEntity(
      productId: json['productId'],
      productTitle: json['productTitle'],
      productSize: json['productSize'] ,
      productColor: json['productColor'] ,
      productImage: json['productImage'] ,
      addToCartDate: json['addToCartDate'] ,
      productQuantity: json['productQuantity'] ,
      totalPrice: json['totalPrice'] ,
      productPrice: json['productPrice'],
    );
  }
}
