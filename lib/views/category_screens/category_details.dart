import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/category_screens/item_details_screen.dart';
import 'package:emart_app/widgets/bg_widget.dart';
import 'package:emart_app/widgets/loading_indicator.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final String? titile;
  const CategoryDetailsScreen({
    super.key,
    required this.titile,
  });

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  // var controller = Get.find<ProductController>();
  var controller = Get.put(ProductController());
  dynamic subCategoryProduct;

  @override
  void initState() {
    super.initState();
    switchCategory(widget.titile);
  }

  switchCategory(titile) {
    if (controller.storeData.contains(titile)) {
      subCategoryProduct = FirestoreServices.getSubCategoryProduct(titile);
    } else {
      subCategoryProduct = FirestoreServices.getProduct(titile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: widget.titile!.text.fontFamily(bold).make(),
        ),
        body: Column(
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
                      .make()
                      .onTap(() {
                    switchCategory('${controller.storeData[index]}');
                    setState(() {});
                  }),
                ),
              ),
            ),
            20.heightBox,
            StreamBuilder(
                stream: subCategoryProduct,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      child: loadingIndicator(color: redColor),
                    );
                  } else if (snapshot.data!.docs.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: "No Product Found!".text.color(darkFontGrey).fontFamily(semibold).size(16).make(),
                      ),
                    );
                  } else {
                    var data = snapshot.data!.docs;
                    return Expanded(
                        child: GridView.builder(
                      itemCount: data.length,
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
                            Image.network(
                              data[index]['p_images'][0],
                              width: 200,
                              height: 120,
                              fit: BoxFit.fill,
                            ),
                            const Spacer(),
                            '${data[index]['p_name']}'.text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            '${data[index]['p_price']}'.numCurrency.text.fontFamily(bold).color(redColor).size(18).make()
                          ],
                        ).box.white.roundedSM.outerShadowMd.padding(const EdgeInsets.all(12)).margin(const EdgeInsets.symmetric(horizontal: 4)).make().onTap(() {
                          controller.checkIsFav(data[index]);

                          Get.to(() => ItemDetailsScreen(
                                titile: data[index]['p_name'],
                                data: data[index],
                              ));
                        });
                      },
                    ));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
