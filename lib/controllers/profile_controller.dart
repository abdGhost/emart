import 'package:emart_app/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;

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

  
}
