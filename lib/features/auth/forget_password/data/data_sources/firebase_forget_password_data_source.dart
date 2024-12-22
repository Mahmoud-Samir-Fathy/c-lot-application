import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/forget_password/domain/entities/user_forget_password_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseForgetPasswordDataSource {
  Future<Either> forgetRequest(UserForgetReq user);

}
class FirebaseForgetPasswordDataSourceImpl implements FirebaseForgetPasswordDataSource{
  static const String _successMessage = 'Sign In Successfully';
  static const String _unknownError = 'An unknown error occurred.';
  @override
  Future<Either> forgetRequest(UserForgetReq user) async{

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: user.email);
      return const Right(_successMessage);
    }on FirebaseException
        catch(e){
      return const Left(_unknownError);
    }
  }
}