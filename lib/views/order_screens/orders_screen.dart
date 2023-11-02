import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/services/firestore_services.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(title: 'My Orders'.text.color(darkFontGrey).fontFamily(semibold).make()),
      body: StreamBuilder(
        stream: FirestoreServices.getALlOrders(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: 'Order not placed yet!'.text.fontFamily(semibold).color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: '${index + 1}'.text.fontFamily(semibold).color(darkFontGrey).make(),
                    title: '${data[index]['order_code']}'.text.fontFamily(semibold).color(redColor).make(),
                    subtitle: '${data[index]['total_amount']}'.numCurrency.text.fontFamily(semibold).color(darkFontGrey).make(),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: redColor,
                      ),
                      onPressed: () {},
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
