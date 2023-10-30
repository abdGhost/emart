import 'package:emart_app/consts/consts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            "Chat Screen".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: redColor,
              ),
            ),
            Row(
              children: [
                TextFormField(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
