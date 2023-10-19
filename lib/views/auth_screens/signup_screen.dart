import 'package:emart_app/controllers/auth_controller/auth_controller.dart';
import 'package:emart_app/views/home_screens/home.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../widgets/app_logo_widget.dart';
import '../../widgets/bg_widget.dart';
import '../../widgets/custom_textfield_widget.dart';
import '../../widgets/our_button_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  // SignUp text Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

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
              'Join the $appname'.text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextfieldWidget(
                    title: name,
                    hint: nameHint,
                    controller: nameController,
                  ),
                  customTextfieldWidget(
                    title: email,
                    hint: emailHint,
                    controller: emailController,
                  ),
                  customTextfieldWidget(
                    title: password,
                    hint: passwordHint,
                    controller: passwordController,
                  ),
                  customTextfieldWidget(
                    title: retypePassword,
                    hint: passwordHint,
                    controller: retypePasswordController,
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        checkColor: redColor,
                        value: isCheck,
                        onChanged: (newvalue) {
                          setState(() {
                            isCheck = newvalue;
                          });
                        },
                      ),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'I aggree to ',
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                ),
                              ),
                              TextSpan(
                                text: termAndCondition,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                ),
                              ),
                              TextSpan(
                                text: ' & ',
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                ),
                              ),
                              TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  ourButton(
                    color: isCheck == true ? redColor : lightGrey,
                    title: signup,
                    textColor: whiteColor,
                    onPressed: () async {
                      if (isCheck != false) {
                        try {
                          controller
                              .signUp(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                          )
                              .then((value) {
                            return controller.storeUserData(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }).then((value) => {
                                    VxToast.show(context, msg: loggedIn),
                                    Get.offAll(() => const Home()),
                                  });
                        } catch (e) {
                          firebaseAuth.signOut();
                          VxToast.show(context, msg: e.toString());
                        }
                      }
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(
                            fontFamily: bold,
                            color: fontGrey,
                          ),
                        ),
                        TextSpan(
                          text: login,
                          style: TextStyle(
                            fontFamily: bold,
                            color: redColor,
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    Get.back();
                  }),
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
            ],
          ),
        ),
      ),
    );
  }
}
