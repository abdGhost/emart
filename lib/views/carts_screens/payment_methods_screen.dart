import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/icons_list.dart';

import '../../widgets/our_button_widget.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: 'Choose Payment Method'.text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPressed: () {},
          color: redColor,
          textColor: whiteColor,
          title: "Place My Order",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: List.generate(paymentMethodList.length, (index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    style: BorderStyle.solid,
                    width: 1,
                    color: redColor,
                  )),
              child: Image.asset(
                paymentMethodImage[index],
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            );
          }),
        ),
      ),
    );
  }
}
