import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/cart_controller.dart';
import 'package:emart_app/views/carts_screens/payment_methods_screen.dart';
import 'package:emart_app/widgets/custom_textfield_widget.dart';
import 'package:get/get.dart';

import '../../widgets/our_button_widget.dart';

class ShippingDetailsScreen extends StatelessWidget {
  const ShippingDetailsScreen({super.key});

  @override
  build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPressed: () {
            if (controller.addressController.text.length > 10) {
              Get.to(() => const PaymentMethodScreen());
            } else {
              VxToast.show(context, msg: "Please fill the form");
            }
          },
          color: redColor,
          textColor: whiteColor,
          title: "Continue",
        ),
      ),
      appBar: AppBar(
        title: "Shipping Details".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextfieldWidget(
              hint: 'Address',
              title: 'Address',
              controller: controller.addressController,
            ),
            5.heightBox,
            customTextfieldWidget(
              hint: 'City',
              title: 'City',
              controller: controller.cityController,
            ),
            5.heightBox,
            customTextfieldWidget(
              hint: 'State',
              title: 'State',
              controller: controller.stateController,
            ),
            5.heightBox,
            customTextfieldWidget(
              hint: 'Postal Code',
              title: 'Postal Code',
              controller: controller.postalCodeController,
            ),
            5.heightBox,
            customTextfieldWidget(
              hint: 'Phone Number',
              title: 'Phone Number',
              controller: controller.phoneController,
            ),
          ],
        ),
      ),
    );
  }
}
