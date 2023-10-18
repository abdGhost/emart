import 'package:emart_app/consts/icons_list.dart';
import 'package:emart_app/views/profile_screens/components/details_card.dart';
import 'package:emart_app/widgets/bg_widget.dart';

import '../../consts/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
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
              ),
              //Profile Details Section
              Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.white.fontFamily(semibold).make(),
                        "test@gmail.com".text.white.make(),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: whiteColor),
                    ),
                    onPressed: () {},
                    child: "Logout".text.white.fontFamily(semibold).make(),
                  ),
                ],
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detialsCard(
                    width: context.screenWidth / 3.4,
                    count: "00",
                    title: "in your cart",
                  ),
                  detialsCard(
                    width: context.screenWidth / 3.4,
                    count: "00",
                    title: "in your wishlist",
                  ),
                  detialsCard(
                    width: context.screenWidth / 3.4,
                    count: "00",
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
                    title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: darkFontGrey,
                  );
                },
                itemCount: profileButtonList.length,
              ).box.white.rounded.margin(const EdgeInsets.all(8)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()
            ],
          ),
        ),
      ),
    );
  }
}
