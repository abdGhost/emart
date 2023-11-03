import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/category_screens/category_details.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

Widget featuresButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.width(200).margin(const EdgeInsets.symmetric(horizontal: 4)).padding(const EdgeInsets.all(4)).white.outerShadowSm.make().onTap(() {
    Get.to(CategoryDetailsScreen(titile: title));
  });
}
