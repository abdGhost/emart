import 'package:emart_app/consts/icons_list.dart';
import 'package:emart_app/controllers/auth_controller/auth_controller.dart';
import 'package:emart_app/views/auth_screens/signup_screen.dart';
import 'package:emart_app/views/home_screens/home.dart';
import 'package:emart_app/widgets/custom_textfield_widget.dart';
import '../../widgets/our_button_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../widgets/app_logo_widget.dart';
import '../../widgets/bg_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = Get.put(AuthController());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    controller: emailController,
                  ),
                  customTextfieldWidget(
                    title: 'Password',
                    hint: '******',
                    controller: passwordController,
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
                    onPressed: () async {
                      await controller
                          .login(
                        context: context,
                        email: emailController.text,
                        password: passwordController.text,
                      )
                          .then((value) {
                        if (value != null) {
                          VxToast.show(context, msg: loggedIn);
                          Get.offAll(() => const Home());
                        }
                      });
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
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
            ],
          ),
        ),
      ),
    );
  }
}
