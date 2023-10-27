import 'package:emart_app/consts/consts.dart';

class FirestoreServices {
  static getUser(uid) {
    return firebaseFirestore
        .collection('users')
        .where("id", isEqualTo: uid)
        .snapshots();
  }

  static getProduct(category) {
    return firebaseFirestore
        .collection('products')
        .where('p_category', isEqualTo: category)
        .snapshots();
  }
}
