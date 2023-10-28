import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/icons_list.dart';
import 'package:emart_app/controllers/product_controller.dart';
import 'package:emart_app/widgets/our_button_widget.dart';
import 'package:get/get.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String? titile;
  final dynamic data;
  const ItemDetailsScreen({
    super.key,
    required this.titile,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async {
        controller.resetProductValue();
        return true;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.resetProductValue();
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: titile!.text.fontFamily(semibold).color(darkFontGrey).make(),
          actions: [
            IconButton(
              onPressed: () {
                controller.resetProductValue();
              },
              icon: const Icon(
                Icons.share,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        itemCount: data['p_images'].length,
                        // aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 350,
                        itemBuilder: (context, index) {
                          return Image.network(
                            data['p_images'][index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                    10.heightBox,
                    "${data['p_name']}"
                        .text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    VxRating(
                      isSelectable: false,
                      value: double.parse(data['p_rating']),
                      onRatingUpdate: ((value) {}),
                      count: 5,
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      size: 25,
                      // stepInt: true,
                    ),
                    10.heightBox,
                    "${data['p_price']}"
                        .numCurrency
                        .text
                        .fontFamily(bold)
                        .size(18)
                        .color(redColor)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['p_seller']}"
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .make(),
                              5.heightBox,
                              'In House Brand'
                                  .text
                                  .color(darkFontGrey)
                                  .fontFamily(semibold)
                                  .make(),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Icon(
                            Icons.message_outlined,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(70)
                        .color(textfieldGrey)
                        .padding(const EdgeInsets.symmetric(horizontal: 12))
                        .make(),
                    20.heightBox,
                    Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: 'Color: '.text.color(fontGrey).make(),
                              ),
                              Row(
                                children: List.generate(
                                  data['p_color'].length,
                                  (index) {
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        VxBox()
                                            .size(40, 40)
                                            .color(Color(data['p_color'][index])
                                                .withOpacity(1))
                                            .roundedFull
                                            .margin(const EdgeInsets.symmetric(
                                                horizontal: 4))
                                            .make()
                                            .onTap(() {
                                          controller.changeColorIndex(index);
                                        }),
                                        Visibility(
                                          visible: index ==
                                              controller.colorIndex.value,
                                          child: const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                          20.heightBox,
                          Obx(
                            () => Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child:
                                      'Quantity: '.text.color(fontGrey).make(),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.decreaseQuantity();
                                    controller.calculateTotalPrice(
                                        int.parse(data['p_price']));
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                  ),
                                ),
                                controller.quantity.value.text
                                    .color(darkFontGrey)
                                    .size(16)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                  onPressed: () {
                                    controller.increaseQuantity(
                                        int.parse(data['p_quantity']));
                                    controller.calculateTotalPrice(
                                        int.parse(data['p_price']));
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                ),
                                10.widthBox,
                                '(${data['p_quantity']} available)'
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: 'Total: '.text.color(fontGrey).make(),
                              ),
                              '${controller.totalPrice.value}'
                                  .numCurrency
                                  .text
                                  .size(16)
                                  .fontFamily(bold)
                                  .color(redColor)
                                  .make()
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                        ],
                      ).box.white.shadowSm.make(),
                    ),
                    //Description Section
                    10.heightBox,
                    'Description '
                        .text
                        .fontFamily(semibold)
                        .size(16)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    '${data['p_description']}'
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        itemsDetailsButtonList.length,
                        (index) {
                          return ListTile(
                            title: itemsDetailsButtonList[index]
                                .text
                                .fontFamily(semibold)
                                .size(16)
                                .color(darkFontGrey)
                                .make(),
                            trailing: const Icon(
                              Icons.arrow_forward,
                              color: darkFontGrey,
                            ),
                          );
                        },
                      ),
                    ),
                    20.heightBox,
                    productYouMayAlsoLike.text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .size(16)
                        .make(),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            6,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgP1,
                                      width: 150,
                                      fit: BoxFit.fill,
                                    ),
                                    10.heightBox,
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
                                    .rounded
                                    .padding(const EdgeInsets.all(8))
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .make()),
                      ),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButton(
                onPressed: () {
                  controller.addToCart(
                    context: context,
                    titile: data['p_name'],
                    image: data['p_images'][0],
                    sellerName: data['p_seller'],
                    color: data['p_color'][controller.colorIndex.value],
                    quantity: controller.quantity.value,
                    totalPrice: controller.totalPrice.value,
                  );
                  VxToast.show(context, msg: 'Added To Cart');
                },
                color: redColor,
                textColor: whiteColor,
                title: 'Add to Cart',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
