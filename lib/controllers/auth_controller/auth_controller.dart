import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  //Login Method
  Future<UserCredential?> login({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(
        context,
        msg: e.toString(),
      );
    }
    return userCredential;
  }

  // Signup Method
  Future<UserCredential?> signUp({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //Create collection for storing create user data
  storeUserData({name, email, password}) {
    DocumentReference store = firebaseFirestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'email': email,
      'password': password,
      'id': currentUser!.uid,
      'imageUrl': '',
      'cart_count': '00',
      'total_count': '00',
      'wishlist_count': '00',
    });
  }

  //Sign Out Methods
  signOutMethod({context}) async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
