import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;
  var profielImageLink = '';
  var isLoading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  updateProfileImage(context) async {
    try {
      final profileImage = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (profileImage == null) return;

      profileImagePath.value = profileImage.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filename = p.basename(profileImagePath.value);
    var destination = 'images/ ${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));
    profielImageLink = await ref.getDownloadURL();
  }

  updateProfileData({email, password, imageUrl}) async {
    var profileData = firebaseFirestore.collection(userCollection).doc(currentUser!.uid);

    await profileData.set(
      {
        'email': email,
        'password': password,
        'image_url': imageUrl,
      },
      SetOptions(
        merge: true,
      ),
    );
    isLoading(false);
  }
}
