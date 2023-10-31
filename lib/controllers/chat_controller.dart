import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/home_controller.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    getChatId();
    super.onInit();
  }

  var chats = firebaseFirestore.collection(chatsCollection);

  var friendName = Get.arguments[0];
  var friendId = Get.arguments[1];

  var senderName = Get.find<HomeController>().userName;
  var senderId = currentUser!.uid;

  var messageController = TextEditingController();

  dynamic chatDocId;

  getChatId() async {
    await chats
        .where('users', isEqualTo: {
          friendId: null,
          senderId: null,
        })
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot) {
          if (snapshot.docs.isNotEmpty) {
            chatDocId = snapshot.docs.single.id;
          } else {
            chats.add({
              'created_on': null,
              'last_message': '',
              'users': {friendId: null, senderId: null},
              'to_id': '',
              'from_id': '',
              'friend_name': friendName,
              'sender_name': senderName,
            }).then((value) {
              chatDocId = value.id;
            });
          }
        });
  }

  sendMessage({String? message}) async {
    print(message);
    if (message!.trim().isNotEmpty) {
      chats.doc(chatDocId).update({
        "created_on": FieldValue.serverTimestamp(),
        "last_message": message,
        "from_id": currentUser!.uid,
        "to_id": friendId,
      });
    }
    chats.doc(chatDocId).collection(messagesCollection).doc().set({
      "created_on": FieldValue.serverTimestamp(),
      "last_message": message,
      "uid": currentUser!.uid,
    });
  }
}
