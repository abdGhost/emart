import 'package:emart_app/consts/consts.dart';

Widget senderBubble() {
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.only(bottom: 8),
    decoration: const BoxDecoration(
      color: redColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
    child: Column(
      children: [
        "Message Here..".text.size(16).color(whiteColor).make(),
        10.heightBox,
        "14:30 PM".text.color(whiteColor.withOpacity(0.5)).make(),
      ],
    ),
  );
}
