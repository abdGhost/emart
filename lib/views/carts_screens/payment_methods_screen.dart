import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/icons_list.dart';
import 'package:emart_app/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../../widgets/our_button_widget.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: 'Choose Payment Method'.text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPressed: () {
            controller.placeMyOrder(
              orderPaymentMethod: paymentMethodList[controller.paymentIndex.value],
              totalAmount: controller.totalPrice.value,
            );
          },
          color: redColor,
          textColor: whiteColor,
          title: "Place My Order",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            children: List.generate(paymentMethodList.length, (index) {
              return GestureDetector(
                onTap: () {
                  controller.changePaymentIndex(index);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: controller.paymentIndex.value == index
                        ? Border.all(
                            style: BorderStyle.solid,
                            width: 3,
                            color: redColor,
                          )
                        : const Border(),
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                        paymentMethodImage[index],
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                        colorBlendMode: controller.paymentIndex.value == index ? BlendMode.darken : BlendMode.color,
                        color: controller.paymentIndex.value == index ? Colors.black.withOpacity(0.4) : Colors.transparent,
                      ),
                      controller.paymentIndex.value == index
                          ? Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                value: true,
                                onChanged: (value) {},
                              ),
                            )
                          : const SizedBox(),
                      Positioned(
                        bottom: 4,
                        right: 10,
                        child: paymentMethodList[index].text.white.fontFamily(semibold).size(16).make(),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
