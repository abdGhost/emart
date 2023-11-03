import 'package:emart_app/consts/consts.dart';

class FirestoreServices {
  static getUser(uid) {
    return firebaseFirestore.collection('users').where("id", isEqualTo: uid).snapshots();
  }

  static getProduct(category) {
    return firebaseFirestore.collection('products').where('p_category', isEqualTo: category).snapshots();
  }

  static getCart(uid) {
    return firebaseFirestore.collection(cartCollection).where('id', isEqualTo: uid).snapshots();
  }

  static deleteFromCart(docId) {
    return firebaseFirestore.collection(cartCollection).doc(docId).delete();
  }

  // Get all chat Message
  static getChatMessage(docId) {
    return firebaseFirestore.collection(chatsCollection).doc(docId).collection(messagesCollection).orderBy('created_on', descending: false).snapshots();
  }

  // Get All orders
  static getALlOrders() {
    return firebaseFirestore.collection(orderCollection).where('order_by', isEqualTo: currentUser!.uid).snapshots();
  }

  // Get all wishlist Items
  static getWishlistItems() {
    return firebaseFirestore.collection(productCollection).where('p_wishlist', arrayContains: currentUser!.uid).snapshots();
  }

  // get all messages
  static getMessage() {
    return firebaseFirestore.collection(chatsCollection).where('from_id', isEqualTo: currentUser!.uid).snapshots();
  }

  static getCounts() {
    var res = Future.wait({
      firebaseFirestore.collection(cartCollection).where('added_by', isEqualTo: currentUser!.uid).get().then((value) {
        return value.docs.length;
      }),
      firebaseFirestore.collection(productCollection).where('p_wishlist', arrayContains: currentUser!.uid).get().then((value) {
        return value.docs.length;
      }),
      firebaseFirestore.collection(orderCollection).where('order_by', isEqualTo: currentUser!.uid).get().then((value) {
        return value.docs.length;
      }),
    });
    return res;
  }

  // get All product
  static getAllProduct() {
    return firebaseFirestore.collection(productCollection).snapshots();
  }

  // get all featured products
  static getAllFeaturedProducts() {
    return firebaseFirestore.collection(productCollection).where('is_featured', isEqualTo: true).get();
  }

  static getSearchProduct(String titile) {
    return firebaseFirestore.collection(productCollection).where('p_name', isLessThanOrEqualTo: titile).get();
  }
}
