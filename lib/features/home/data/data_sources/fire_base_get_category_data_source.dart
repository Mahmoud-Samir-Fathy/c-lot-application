import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class FireBaseGetCategoryDataSource {
  Future<Either> getCategories();
}

class FireBaseGetCategoryDataSourceImpl
    implements FireBaseGetCategoryDataSource {
  @override
  Future<Either> getCategories() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('categories')
          .get();

      final categoriesData = snapshot.docs.map((doc) => doc.data()).toList();

      return Right(categoriesData);
    } on FirebaseException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception("An unexpected error occurred: $e"));
    }
  }
}
