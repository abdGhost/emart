import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widgets/bg_widget.dart';
import 'package:emart_app/widgets/custom_textfield_widget.dart';
import 'package:emart_app/widgets/our_button_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var controller = Get.find<ProfileController>();
    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
          appBar: AppBar(),
          body: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imgProfile2,
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
                20.heightBox,
                customTextfieldWidget(
                  title: email,
                  hint: emailHint,
                ),
                customTextfieldWidget(
                  title: password,
                  hint: passwordHint,
                ),
                20.heightBox,
                SizedBox(
                  width: context.screenWidth - 60,
                  child: ourButton(
                    onPressed: () {},
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
          )),
    );
  }
}
