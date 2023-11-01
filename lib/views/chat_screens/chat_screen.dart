import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/chat_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
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
            Obx(() {
              return controller.isLoading.value == true
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ),
                    )
                  : Expanded(
                      child: StreamBuilder(
                      stream: FirestoreServices.getChatMessage(controller.chatDocId.toString()),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            ),
                          );
                        } else if (snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: "Send Message...".text.fontFamily(semibold).color(darkFontGrey).make(),
                          );
                        } else {
                          return ListView(
                            children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                              var data = snapshot.data!.docs[index];
                              return Align(
                                alignment: data['uid'] == currentUser!.uid ? Alignment.centerLeft : Alignment.centerRight,
                                child: senderBubble(
                                  data: data,
                                ),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ));
            }),
            const Spacer(),
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
