import 'package:emart_app/consts/consts.dart';

class FirestoreServices {
  static getUserData(uid) {
    return firebaseFirestore.collection(userCollection).where('id', isEqualTo: uid).snapshots();
  }
}
