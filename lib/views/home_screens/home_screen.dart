import 'package:cloud_firestore/cloud_firestore.dart';
import '../../consts/icons_list.dart';
import '../../services/firestore_services.dart';
import '../../views/home_screens/components/features_button.dart';
import '../../widgets/home_buttons.dart';

import '../../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: context.screenHeight,
      width: context.screenWidth,
      color: lightGrey,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  fillColor: whiteColor,
                  filled: true,
                  hintText: searchAnything,
                  hintStyle: TextStyle(color: textfieldGrey),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    10.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: sliderLists.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sliderLists[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(
                              const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                            )
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(2, (index) {
                        return homeButton(
                          width: context.screenWidth / 2.5,
                          height: context.screenHeight * 0.15,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? todayDeal : flashSale,
                        );
                      }),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: secondSliderLists.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSliderLists[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(
                              const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                            )
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (index) {
                        return homeButton(
                          width: context.screenWidth / 3.5,
                          height: context.screenHeight * 0.15,
                          icon: index == 0
                              ? icTopCategories
                              : index == 0
                                  ? icBrands
                                  : icTopSeller,
                          title: index == 0
                              ? topCategories
                              : index == 1
                                  ? brands
                                  : topSellers,
                        );
                      }),
                    ),
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make(),
                    ),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Column(
                            children: [
                              featuresButton(
                                icon: featuredImages1[index],
                                title: featuredTitles1[index],
                              ),
                              10.heightBox,
                              featuresButton(
                                icon: featuredImages2[index],
                                title: featuredTitles2[index],
                              ),
                            ],
                          ),
                        ).toList(),
                      ),
                    ),
                    20.heightBox,
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white.size(18).fontFamily(bold).make(),
                          10.heightBox,
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: FutureBuilder(
                                future: FirestoreServices.getAllFeaturedProducts(),
                                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(redColor),
                                      ),
                                    );
                                  } else if (snapshot.data!.docs.isEmpty) {
                                    return "No Featured Producted added".text.fontFamily(semibold).color(whiteColor).make();
                                  } else {
                                    var featureProduct = snapshot.data!.docs;
                                    return Row(
                                      children: List.generate(
                                          featureProduct.length,
                                          (index) => Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Image.network(
                                                    featureProduct[index]['p_images'][0],
                                                    width: 200,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  10.heightBox,
                                                  '${featureProduct[index]['p_name']}'.text.fontFamily(semibold).color(darkFontGrey).make(),
                                                  10.heightBox,
                                                  '${featureProduct[index]['p_price']}'.numCurrency.text.fontFamily(bold).color(redColor).size(18).make()
                                                ],
                                              ).box.white.rounded.padding(const EdgeInsets.all(8)).margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
                                    );
                                  }
                                },
                              ))
                        ],
                      ),
                    ),
                    20.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: secondSliderLists.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSliderLists[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(
                              const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                            )
                            .make();
                      },
                    ),
                    20.heightBox,
                    // All Product Section
                    'All Products'.text.size(16).fontFamily(bold).color(darkFontGrey).make(),
                    10.heightBox,
                    StreamBuilder(
                        stream: FirestoreServices.getAllProduct(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(redColor),
                              ),
                            );
                          } else {
                            var allProduts = snapshot.data!.docs;
                            return GridView.builder(
                                itemCount: allProduts.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 300,
                                ),
                                itemBuilder: ((context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        allProduts[index]['p_images'][0],
                                        width: 200,
                                        fit: BoxFit.fill,
                                      ),
                                      const Spacer(),
                                      "${allProduts[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                                      10.heightBox,
                                      "${allProduts[index]['p_price']}".numCurrency.text.fontFamily(bold).color(redColor).size(18).make()
                                    ],
                                  ).box.white.rounded.padding(const EdgeInsets.all(12)).margin(const EdgeInsets.symmetric(horizontal: 4)).make();
                                }));
                          }
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
