import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/icons_list.dart';
import 'package:emart_app/controllers/auth_controller/auth_controller.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/auth_screens/login_screen.dart';
import 'package:emart_app/views/profile_screens/components/details_card.dart';
import 'package:emart_app/views/profile_screens/edit_profile_screen.dart';
import 'package:emart_app/widgets/bg_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    // print(FirestoreServices.getUser(currentUser!.uid));

    return bgWidget(
      child: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            print(currentUser!.uid);
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    redColor,
                  ),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];
              controller.nameController.text = data['name'];
              controller.passwordController.text = data['password'];

              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      //Edit Profile Section
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Icon(
                            Icons.edit,
                            color: whiteColor,
                          ),
                        ),
                      ).onTap(() {
                        Get.to(() => EditProfileScreen(
                              data: data,
                            ));
                      }),
                      //Profile Details Section
                      Row(
                        children: [
                          data['imageUrl'] == ''
                              ? Image.asset(
                                  imgProfile2,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make()
                              : Image.network(
                                  data['imageUrl'],
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}"
                                    .text
                                    .white
                                    .fontFamily(semibold)
                                    .make(),
                                "${data['email']}".text.white.make(),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: whiteColor),
                            ),
                            onPressed: () async {
                              await Get.put(AuthController()).signOutMethod();
                              Get.offAll(() => const LoginScreen());
                            },
                            child:
                                "Logout".text.white.fontFamily(semibold).make(),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detialsCard(
                            width: context.screenWidth / 3.4,
                            count: "${data['cart_count']}",
                            title: "in your cart",
                          ),
                          detialsCard(
                            width: context.screenWidth / 3.4,
                            count: "${data['wishlist_count']}",
                            title: "in wishlist",
                          ),
                          detialsCard(
                            width: context.screenWidth / 3.4,
                            count: "${data['total_count']}",
                            title: "your orders",
                          ),
                        ],
                      ),
                      10.heightBox,
                      ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset(
                              profileButtonImages[index],
                              width: 20,
                              fit: BoxFit.cover,
                            ),
                            title: profileButtonList[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: darkFontGrey,
                          );
                        },
                        itemCount: profileButtonList.length,
                      )
                          .box
                          .white
                          .rounded
                          .margin(const EdgeInsets.all(8))
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .shadowSm
                          .make()
                          .box
                          .color(redColor)
                          .make()
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
