import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseGetFavouritesDataSource{
  Future<Either> getFavouriteProducts();

}

class FireBaseGetFavouritesDataSourceImpl implements FireBaseGetFavouritesDataSource{
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