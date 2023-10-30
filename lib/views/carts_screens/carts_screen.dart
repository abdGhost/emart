import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/controllers/cart_controller.dart';
import 'package:emart_app/widgets/our_button_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../services/firestore_services.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shopping Cart"
            .text
            .color(darkFontGrey)
            .fontFamily(semibold)
            .make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getCart(currentUser!.uid),
        builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "Cart is empty"
                  .text
                  .fontFamily(semibold)
                  .color(darkFontGrey)
                  .make(),
            );
          } else {
            var data = snapshot.data!.docs;
            controller.calculateTotalPrice(data);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                            '${data[index]['image']}',
                          ),
                          title:
                              '${data[index]['titile']} (${data[index]['quantity']})'
                                  .text
                                  .fontFamily(semibold)
                                  .size(16)
                                  .make(),
                          subtitle: '${data[index]['totalPrice']}'
                              .numCurrency
                              .text
                              .fontFamily(semibold)
                              .color(redColor)
                              .make(),
                          trailing: const Icon(
                            Icons.delete,
                            color: redColor,
                          ).onTap(() {
                            print(data[index].id);
                            FirestoreServices.deleteFromCart(data[index].id);
                          }),
                        );
                      },
                    ),
                  ),
                  const HeightBox(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Total Price"
                          .text
                          .fontFamily(semibold)
                          .color(fontGrey)
                          .make(),
                      Obx(
                        () => "${controller.totalPrice}"
                            .numCurrency
                            .text
                            .fontFamily(semibold)
                            .color(redColor)
                            .make(),
                      )
                    ],
                  )
                      .box
                      .color(lightGolden)
                      .roundedSM
                      .padding(const EdgeInsets.all(12))
                      .width(context.screenWidth - 60)
                      .make(),
                  const HeightBox(10),
                  SizedBox(
                    width: context.screenWidth - 60,
                    child: ourButton(
                        onPressed: () {},
                        color: redColor,
                        textColor: whiteColor,
                        title: "Procced To Shoping"),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
