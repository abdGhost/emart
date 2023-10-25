import 'package:emart_app/consts/consts.dart';

class FirestoreServices {
  static getUser(uid) {
    firebaseFirestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
