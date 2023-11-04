import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../consts/consts.dart';
import '../../services/firestore_services.dart';
import '../../views/category_screens/item_details_screen.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  final String title;
  const SearchScreen({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title.text.color(darkFontGrey).make(),
      ),
      body: FutureBuilder(
          future: FirestoreServices.getSearchProduct(title),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: 'No Product Found'.text.color(darkFontGrey).fontFamily(bold).size(16).make(),
              );
            } else {
              var data = snapshot.data!.docs;
              var seacrhData = data
                  .where(((element) => element['p_name'].toString().toLowerCase().contains(
                        title.toLowerCase(),
                      )))
                  .toList();
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 300,
                ),
                children: seacrhData
                    .mapIndexed((currentValue, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              seacrhData[index]['p_images'][0],
                              width: 140,
                              height: 140,
                              fit: BoxFit.fill,
                            ),
                            10.heightBox,
                            "${seacrhData[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "${seacrhData[index]['p_price']}".numCurrency.text.fontFamily(bold).color(redColor).size(18).make()
                          ],
                        ).box.white.padding(const EdgeInsets.all(12)).outerShadowMd.margin(const EdgeInsets.symmetric(horizontal: 4)).make().onTap(() {
                          Get.to(() => ItemDetailsScreen(titile: seacrhData[index]['p_name'], data: seacrhData[index]));
                        }))
                    .toList(),
              );
            }
          }),
    );
  }
}
