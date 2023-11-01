import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:intl/intl.dart' as intl;

Widget senderBubble({DocumentSnapshot? data}) {
  // For formatting chat message date
  var t = data!['created_on'] == null ? DateTime.now() : data['created_on'].toDate();
  var formatTime = intl.DateFormat("h:mma").format(t);
  return Directionality(
    textDirection: data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: data['uid'] == currentUser!.uid ? darkFontGrey : redColor,
        borderRadius: data['uid'] == currentUser!.uid
            ? const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '${data['last_message']}'.text.size(16).color(whiteColor).make(),
          10.heightBox,
          formatTime.text.size(14).color(whiteColor.withOpacity(0.5)).make(),
        ],
      ),
    ),
  );
}
