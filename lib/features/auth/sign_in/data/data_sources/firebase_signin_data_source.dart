import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/entities/signIn_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseSignInDataSource {
  Future<Either<String, String>> signIn(UserLogin user);
}

class FirebaseSignInDataSourceImpl implements FirebaseSignInDataSource {
  static const String _successMessage = 'Sign In Successfully';
  static const String _unknownError = 'An unknown error occurred.';

  @override
  Future<Either<String, String>> signIn(UserLogin user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password!,
      );
      return const Right(_successMessage);
    } on FirebaseAuthException catch (e) {
      return Left(_mapFirebaseErrorToMessage(e));
    } catch (e) {
      return const Left(_unknownError);
    }
  }

  String _mapFirebaseErrorToMessage(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'user-not-found':
        return 'No user found for the provided email.';
      case 'wrong-password':
        return 'Incorrect password provided.';
      default:
        return _unknownError;
    }
  }
}
