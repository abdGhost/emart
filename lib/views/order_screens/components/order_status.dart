import 'package:emart_app/consts/consts.dart';

Widget orderStatus({icon, color, title, showDone}) {
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ).box.color(color).make(),
    trailing: Row(
      children: [
        '$title'.text.fontFamily(semibold).color(darkFontGrey).make(),
        showDone
            ? const Icon(
                Icons.done,
                color: redColor,
              )
            : const SizedBox(),
      ],
    ),
  );
}
