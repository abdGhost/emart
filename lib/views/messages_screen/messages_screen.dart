import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/chat_screens/chat_screen.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(title: 'Message Screen'.text.fontFamily(semibold).color(darkFontGrey).make()),
      body: StreamBuilder(
        stream: FirestoreServices.getMessage(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: 'No Messages Yet!'.text.fontFamily(semibold).color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Get.to(
                                  () => const ChatScreen(),
                                  arguments: [
                                    data[index]['friend_name'],
                                    data[index]['to_id'],
                                  ],
                                );
                              },
                              leading: const CircleAvatar(
                                backgroundColor: redColor,
                                child: Icon(
                                  Icons.person,
                                  color: whiteColor,
                                ),
                              ),
                              title: '${data[index]['friend_name']}'.text.fontFamily(semibold).color(darkFontGrey).make(),
                              subtitle: '${data[index]['last_message']}'.text.make(),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
