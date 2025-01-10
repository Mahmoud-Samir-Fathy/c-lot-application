import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/home/domain/entities/colors_entity.dart';

class ProductEntity {
  final String productId;
  final String categoryId;
  final int discountPrice;
  final String gender;
  final Timestamp categoryDate;
  final List<String> image;
  final int price;
  final int salesNumber;
  final List<int> sizes;
  final String title;
  final List<ColorsEntity> colors;

  ProductEntity({
    required this.productId,
    required this.categoryId,
    required this.discountPrice,
    required this.gender,
    required this.categoryDate,
    required this.image,
    required this.price,
    required this.salesNumber,
    required this.sizes,
    required this.title,
    required this.colors,
  });

  // From JSON
  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      productId: json['productId'] as String,
      categoryId: json['categoryId'] as String,
      discountPrice: json['discountPrice'] as int,
      gender: json['gender'] as String,
      categoryDate: json['categoryDate'] as Timestamp,
      image: List<String>.from(json['image'] as List),
      price: json['price'] as int,
      salesNumber: json['salesNumber'] as int,
      sizes: List<int>.from(json['sizes'] as List),
      title: json['title'] as String,
      colors: (json['colors'] as List)
          .map((color) => ColorsEntity.fromJson(color as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'categoryId': categoryId,
      'discountPrice': discountPrice,
      'gender': gender,
      'categoryDate': categoryDate,
      'image': image,
      'price': price,
      'salesNumber': salesNumber,
      'sizes': sizes,
      'title': title,
      'colors': colors.map((color) => color.toMap()).toList(),
    };
  }
}