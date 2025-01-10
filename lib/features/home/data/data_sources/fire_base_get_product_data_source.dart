import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseGetProductDataSource {
  Future<Either> getTopSellingProducts();

  Future<Either> getNewInProducts();

  Future<Either> getProductsByCategoryId(String categoryId);

  Future<Either> getAllProducts(String title);

  Future<Either> setToFavourite(ProductEntity product);

  Future<bool> isFavourite(String productId);
  Future <Either> getFavouriteProducts();

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
      var dataReturned =
          await FirebaseFirestore.instance.collection('products').get();
      final productData = dataReturned.docs.map((doc) => doc.data()).toList();
      return Right(productData);
    } on FirebaseException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> setToFavourite(ProductEntity product) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var dataReturned = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('favourites')
          .where('productId', isEqualTo: product.productId)
          .get();
      if (dataReturned.docs.isNotEmpty) {
        dataReturned.docs.first.reference.delete();
        return const Right(false);
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('favourites')
            .add(product.toMap());
        return const Right(true);
      }
    } catch (e) {
      return const Left('Something went wrong');
    }
  }

  @override
  Future<bool> isFavourite(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var dataReturned = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('favourites')
          .where('productId', isEqualTo: productId)
          .get();
      if (dataReturned.docs.isNotEmpty) {
        return true;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavouriteProducts() async{
    try{
      var user=FirebaseAuth.instance.currentUser;
      final returnedData= await FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('favourites').get();
      return Right(returnedData.docs.map((e) => e.data()).toList());

    }catch(e){
      return const Left('Something went wrong');
    }
  }
}
