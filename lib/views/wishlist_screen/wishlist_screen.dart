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
            return Container();
          }
        },
      ),
    );
  }
}
