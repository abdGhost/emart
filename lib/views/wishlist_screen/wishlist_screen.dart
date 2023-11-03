import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/services/firestore_services.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: 'Wishlist Items'.text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getWishlistItems(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snaphsot) {
          if (!snaphsot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else if (snaphsot.data!.docs.isEmpty) {
            return Center(
              child: 'No items at wishlist'.text.fontFamily(semibold).color(darkFontGrey).make(),
            );
          } else {
            var data = snaphsot.data!.docs;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      '${data[index]['p_images'][0]}',
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    title: '${data[index]['p_name']}'.text.fontFamily(semibold).size(16).make(),
                    subtitle: '${data[index]['p_price']}'.numCurrency.text.fontFamily(semibold).color(redColor).make(),
                    trailing: const Icon(
                      Icons.favorite,
                      color: redColor,
                    ).onTap(() {
                      firebaseFirestore.collection(productCollection).doc(data[index].id).set(
                        {
                          'p_wishlist': FieldValue.arrayRemove([currentUser!.uid]),
                        },
                        SetOptions(merge: true),
                      );
                    }),
                  );
                });
          }
        },
      ),
    );
  }
}
