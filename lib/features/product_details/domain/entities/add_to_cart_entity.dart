import 'package:cloud_firestore/cloud_firestore.dart';

class AddToCartEntity {
  final String productId;
  final String productTitle;
  final int productSize;
  final String productColor;
  final String productImage;
  final Timestamp addToCartDate;
  final int productQuantity;
  final double totalPrice;
  final double productPrice;

  AddToCartEntity({
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

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productTitle': productTitle,
      'productSize': productSize,
      'productColor': productColor,
      'productImage': productImage,
      'addToCartDate': addToCartDate,
      'productQuantity': productQuantity,
      'totalPrice': totalPrice,
      'productPrice': productPrice,
    };
  }
}
