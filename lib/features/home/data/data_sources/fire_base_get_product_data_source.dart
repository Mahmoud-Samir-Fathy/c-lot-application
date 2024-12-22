import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class FireBaseGetProductDataSource {
  Future<Either> getTopSellingProducts();

  Future<Either> getNewInProducts();

  Future<Either> getProductsByCategoryId(String categoryId);

  Future<Either> getAllProducts(String title);
}

class FireBaseGetProductDataSourceImpl implements FireBaseGetProductDataSource {
  @override
  Future<Either> getTopSellingProducts() async {
    try {
      var dataReturned = await FirebaseFirestore.instance
          .collection('products')
          .where('salesNumber', isGreaterThan: 20)
          .get();
      final productData = dataReturned.docs.map((doc) => doc.data()).toList();
      return Right(productData);
    } on FirebaseException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getNewInProducts() async {
    try {
      var dataReturned = await FirebaseFirestore.instance
          .collection('products')
          .where('categoryDate',
              isGreaterThan: Timestamp.fromDate(DateTime(2024, 12, 20)))
          .get();
      final productData = dataReturned.docs.map((doc) => doc.data()).toList();
      return Right(productData);
    } on FirebaseException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    try {
      var dataReturned = await FirebaseFirestore.instance
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      final productData = dataReturned.docs.map((doc) => doc.data()).toList();
      return Right(productData);
    } on FirebaseException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getAllProducts(String title) async {
    try {
      var dataReturned = await FirebaseFirestore.instance
          .collection('products')
          .get();
      final productData = dataReturned.docs.map((doc) => doc.data()).toList();
      return Right(productData);
    } on FirebaseException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(e);
    }
  }
}
