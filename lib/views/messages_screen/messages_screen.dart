import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/services/firestore_services.dart';

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
            return Container();
          }
        },
      ),
    );
  }
}
