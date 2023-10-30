import 'dart:io';

import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widgets/bg_widget.dart';
import 'package:emart_app/widgets/custom_textfield_widget.dart';
import 'package:emart_app/widgets/our_button_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
          appBar: AppBar(),
          body: Obx(
            () => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                      ? Image.asset(
                          imgProfile2,
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : data['imageUrl'] != '' &&
                              controller.profileImageLink.isEmpty
                          ? Image.network(
                              data['imageUrl'],
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.file(
                              File(controller.profileImagePath.value),
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.heightBox,
                  ourButton(
                      onPressed: () {
                        controller.updateProfileImage(context);
                      },
                      color: whiteColor,
                      textColor: redColor,
                      title: 'Change '),
                  const Divider(),
                  10.heightBox,
                  customTextfieldWidget(
                    controller: controller.nameController,
                    title: email,
                    hint: emailHint,
                  ),
                  10.heightBox,
                  customTextfieldWidget(
                    controller: controller.oldPasswordController,
                    title: oldPassword,
                    hint: passwordHint,
                  ),
                  10.heightBox,
                  customTextfieldWidget(
                    controller: controller.newPasswordController,
                    title: newPassword,
                    hint: passwordHint,
                  ),
                  10.heightBox,
                  SizedBox(
                    width: context.screenWidth - 60,
                    child: controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            ),
                          )
                        : ourButton(
                            onPressed: () async {
                              controller.isLoading(true);
                              if (controller
                                  .profileImagePath.value.isNotEmpty) {
                                await controller.uploadProfileImage();
                              } else {
                                controller.profileImageLink = data['imageUrl'];
                              }

                              if (data['password'] ==
                                  controller.oldPasswordController.text) {
                                await controller.changeAuthProfile(
                                  email: data['email'],
                                  password:
                                      controller.oldPasswordController.text,
                                  newPassword:
                                      controller.newPasswordController.text,
                                );
                                await controller.updateProfileData(
                                  name: controller.nameController.text,
                                  password:
                                      controller.newPasswordController.text,
                                  imageUrl: controller.profileImagePath.value,
                                );
                                // ignore: use_build_context_synchronously
                                VxToast.show(context, msg: 'Profile Updated');
                              } else {
                                // ignore: use_build_context_synchronously
                                VxToast.show(context,
                                    msg: 'Wrong Old Password');
                                controller.isLoading(false);
                              }
                            },
                            color: redColor,
                            textColor: whiteColor,
                            title: 'Save',
                          ),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .shadowSm
                  .padding(const EdgeInsets.all(16))
                  .margin(const EdgeInsets.only(top: 20, left: 12, right: 12))
                  .make(),
            ),
          )),
    );
  }
}
