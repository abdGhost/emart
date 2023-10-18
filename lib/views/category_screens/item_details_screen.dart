import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/icons_list.dart';
import 'package:emart_app/widgets/our_button_widget.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String? titile;
  const ItemDetailsScreen({
    super.key,
    required this.titile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: titile!.text.fontFamily(semibold).color(darkFontGrey).make(),
        actions: [
          IconButton(
            onPressed: () {},
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
                      itemCount: 3,
                      // aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 350,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  10.heightBox,
                  titile!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  VxRating(
                    onRatingUpdate: ((value) {}),
                    count: 5,
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  '\$30,000'.text.fontFamily(bold).size(18).color(redColor).make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'Seller'.text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            'In House Brand'.text.color(darkFontGrey).fontFamily(semibold).make(),
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
                  ).box.height(70).color(textfieldGrey).padding(const EdgeInsets.symmetric(horizontal: 12)).make(),
                  20.heightBox,
                  Column(
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
                            children: List.generate(3, (index) {
                              return VxBox().size(40, 40).color(Vx.randomPrimaryColor).roundedFull.margin(const EdgeInsets.symmetric(horizontal: 4)).make();
                            }),
                          )
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      20.heightBox,
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: 'Quantity: '.text.color(fontGrey).make(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                          "0".text.color(darkFontGrey).size(16).fontFamily(bold).make(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                          10.widthBox,
                          '(0 available)'.text.color(textfieldGrey).make(),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      10.heightBox,
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: 'Total: '.text.color(fontGrey).make(),
                          ),
                          '\$0.00'.text.size(16).fontFamily(bold).color(redColor).make()
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.shadowSm.make(),

                  //Description Section
                  10.heightBox,
                  'Description '.text.fontFamily(semibold).size(16).color(darkFontGrey).make(),
                  10.heightBox,
                  'This is dummy desciption This is dummy desciptionThis is dummy desciptionThis is dummy desciption'.text.fontFamily(semibold).color(darkFontGrey).make(),
                  10.heightBox,
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      itemsDetailsButtonList.length,
                      (index) {
                        return ListTile(
                          title: itemsDetailsButtonList[index].text.fontFamily(semibold).size(16).color(darkFontGrey).make(),
                          trailing: const Icon(
                            Icons.arrow_forward,
                            color: darkFontGrey,
                          ),
                        );
                      },
                    ),
                  ),
                  20.heightBox,
                  productYouMayAlsoLike.text.color(darkFontGrey).fontFamily(semibold).size(16).make(),
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
                                  "Laptop 12GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                                  10.heightBox,
                                  "\$500".text.fontFamily(bold).color(redColor).size(18).make()
                                ],
                              ).box.white.rounded.padding(const EdgeInsets.all(8)).margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
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
              onPressed: () {},
              color: redColor,
              textColor: whiteColor,
              title: 'Add to Cart',
            ),
          ),
        ],
      ),
    );
  }
}
