import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseAuthenticationDataSource {
  Future<bool> authentication();
}

class FireBaseAuthenticationDataSourceImpl
    implements FireBaseAuthenticationDataSource {
  @override
  Future<bool> authentication() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
