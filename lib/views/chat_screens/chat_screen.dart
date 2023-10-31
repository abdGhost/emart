import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/chat_controller.dart';
import 'package:get/get.dart';

import 'components/sender_bubbles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Chat Screen".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: ListView(
                  children: [
                    senderBubble(),
                    senderBubble(),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.messageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: fontGrey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: fontGrey,
                        ),
                      ),
                      hintText: "Type a message....",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.sendMessage(message: controller.messageController.text);
                    controller.messageController.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: redColor,
                  ),
                )
              ],
            ).box.height(80).padding(const EdgeInsets.all(12)).margin(const EdgeInsets.only(bottom: 8)).make()
          ],
        ),
      ),
    );
  }
}
