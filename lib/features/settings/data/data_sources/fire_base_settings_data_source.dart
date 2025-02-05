import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/settings/domain/entities/address_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseSettingsDataSource {
  Future<Either> getFavouriteProducts();

  Future<Either> signOut();

  Future<Either> addAddress(AddressEntity address);


  Future<Either> getAddresses();


}

class FireBaseSettingsDataSourceImpl implements FireBaseSettingsDataSource {
  @override
  Future<Either> getFavouriteProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      final returnedData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('favourites')
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Something went wrong');
    }
  }

  @override
  Future<Either> signOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      return const Right("User signed out successfully");
    } catch (e) {
      return Left("Error signing out: $e");
    }
  }

  @override
  Future<Either> addAddress(AddressEntity address) async {
    try{
      final user = FirebaseAuth.instance.currentUser;

     final data= await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('address')
          .add(address.toMap());
      return Right(data);
    }catch(e){
      return const Left('Something went wrong');
    }
  }

  @override
  Future<Either> getAddresses() async{
    try{
      final user = FirebaseAuth.instance.currentUser;

      final data= await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('address')
          .get();
      return Right(data);
    }catch(e){
      return const Left('Something went wrong');
    }
  }
}
