import 'package:emart_app/controllers/product_controller.dart';
import 'package:emart_app/views/category_screens/category_details.dart';
import 'package:emart_app/widgets/bg_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../consts/icons_list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: category.text.fontFamily(bold).white.make(),
        ),
        body: Container(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              itemCount: 9,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 200,
              ),
              itemBuilder: ((context, index) => Column(
                    children: [
                      Image.asset(
                        categoriesImagesList[index],
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      categoriesLists[index]
                          .text
                          .color(darkFontGrey)
                          .align(TextAlign.center)
                          .make(),
                    ],
                  )
                      .box
                      .white
                      .roundedSM
                      .clip(Clip.antiAlias)
                      .outerShadowSm
                      .make()
                      .onTap(() {
                    controller.getProductData(categoriesLists[index]);
                    Get.to(() =>
                        CategoryDetailsScreen(titile: categoriesLists[index]));
                  })),
            )),
      ),
    );
  }
}
