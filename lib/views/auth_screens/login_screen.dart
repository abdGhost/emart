import 'package:emart_app/consts/social_icon.dart';
import 'package:emart_app/views/auth_screens/signup_screen.dart';
import 'package:emart_app/views/home_screens/home.dart';
import 'package:emart_app/widgets/custom_textfield_widget.dart';
import 'package:emart_app/widgets/our_button_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../widgets/app_logo_widget.dart';
import '../../widgets/bg_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWigdet(),
              10.heightBox,
              'Log in to $appname'.text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextfieldWidget(
                    title: 'Email',
                    hint: 'email@example.com',
                  ),
                  customTextfieldWidget(
                    title: 'Password',
                    hint: '******',
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  5.heightBox,
                  ourButton(
                    color: redColor,
                    title: login,
                    textColor: whiteColor,
                    onPressed: () {
                      Get.to(() => const Home());
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                    color: lightGolden,
                    title: signup,
                    textColor: redColor,
                    onPressed: () {
                      Get.to(
                        () => const SignupScreen(),
                      );
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: lightGrey,
                          child: Image.asset(
                            socialIconList[index],
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
