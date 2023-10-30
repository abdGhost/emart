import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets/our_button_widget.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(fontGrey).make(),
        const Divider(),
        10.heightBox,
        "Are you sure you want to exit ?"
            .text
            .fontFamily(bold)
            .size(16)
            .color(fontGrey)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              color: redColor,
              textColor: whiteColor,
              title: "Yes",
            ),
            ourButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: redColor,
              textColor: whiteColor,
              title: "No",
            ),
          ],
        )
      ],
    ).box.color(lightGrey).roundedSM.padding(const EdgeInsets.all(12)).make(),
  );
}
