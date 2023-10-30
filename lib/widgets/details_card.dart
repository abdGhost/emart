import '../consts/consts.dart';

Widget detialsCard({width, String? count, String? title}) {
  return Column(
    children: [
      count!.text.fontFamily(bold).size(16).make(),
      5.heightBox,
      title!.text.make(),
    ],
  ).box.white.rounded.width(width).height(60).padding(const EdgeInsets.all(8)).make();
}
