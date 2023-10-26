import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;
  var profileImageLink = '';
  var isLoading = false.obs;

  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  updateProfileImage(context) async {
    try {
      final profileImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (profileImage == null) return;

      profileImagePath.value = profileImage.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filename = Path.basename(profileImagePath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    var ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));

    profileImageLink = await ref.getDownloadURL();
  }

  updateProfileData({name, password, imageUrl}) {
    var store =
        firebaseFirestore.collection(userCollection).doc(currentUser!.uid);
    store.set(
      {
        'name': name,
        'password': password,
        'image_url': imageUrl,
      },
      SetOptions(merge: true),
    );
    isLoading(false);
  }
}
