import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/category_screens/item_details_screen.dart';
import 'package:emart_app/widgets/bg_widget.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String? titile;
  const CategoryDetailsScreen({
    super.key,
    required this.titile,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: titile!.text.fontFamily(bold).make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  controller.storeData.length,
                  (index) => '${controller.storeData[index]}'
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .makeCentered()
                      .box
                      .white
                      .rounded
                      .size(150, 60)
                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                      .make(),
                ),
              ),
            ),
            20.heightBox,
            Expanded(
                child: GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imgP1,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                    const Spacer(),
                    "Laptop 12GB/64GB"
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    "\$500"
                        .text
                        .fontFamily(bold)
                        .color(redColor)
                        .size(18)
                        .make()
                  ],
                )
                    .box
                    .white
                    .roundedSM
                    .outerShadowMd
                    .padding(const EdgeInsets.all(12))
                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                    .make()
                    .onTap(() {
                  Get.to(() => const ItemDetailsScreen(
                        titile: 'Text',
                      ));
                });
              },
            ))
          ],
        ),
      ),
    ));
  }
}
