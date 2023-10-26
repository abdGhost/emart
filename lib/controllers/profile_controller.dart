import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;
  var profileImageLink = '';
  var isLoading = false.obs;

  var nameController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  updateProfileImage(context) async {
    try {
      final profileImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (profileImage == null) return;

      profileImagePath.value = profileImage.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filename = basename(profileImagePath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));

    profileImageLink = await ref.getDownloadURL();
  }

  updateProfileData({name, password, imageUrl}) async {
    var store =
        firebaseFirestore.collection(userCollection).doc(currentUser!.uid);
    await store.set(
      {
        'name': name,
        'password': password,
        'image_url': imageUrl,
      },
      SetOptions(merge: true),
    );
    isLoading(false);
  }

  changeAuthProfile({email, password, newPassword}) async {
    var creditinal =
        EmailAuthProvider.credential(email: email, password: password);
    await currentUser!
        .reauthenticateWithCredential(creditinal)
        .then((value) => currentUser!.updatePassword(newPassword))
        // ignore: argument_type_not_assignable_to_error_handler
        .catchError(() {
      print('error');
    });
  }
}
