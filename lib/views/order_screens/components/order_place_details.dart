import '../../../consts/consts.dart';

Widget orderPlacedetails({title1, title2, detail1, details2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            // ignore: unnecessary_brace_in_string_interps
            '${title1}'.text.fontFamily(semibold).color(darkFontGrey).make(),
            // ignore: unnecessary_brace_in_string_interps
            '${detail1}'.text.color(redColor).make(),
          ],
        ),
        Column(
          children: [
            // ignore: unnecessary_brace_in_string_interps
            '${title1}'.text.fontFamily(semibold).color(darkFontGrey).make(),
            // ignore: unnecessary_brace_in_string_interps
            '${details2}'.text.make(),
          ],
        ),
      ],
    ),
  );
}
