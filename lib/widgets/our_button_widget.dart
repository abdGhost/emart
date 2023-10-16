import 'package:emart_app/consts/consts.dart';

Widget ourButton({onPressed, color, textColor, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPressed,
    child: title!.text.fontFamily(bold).color(textColor).make(),
  );
}
