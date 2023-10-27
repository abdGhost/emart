import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var storeData = [];
  var colorIndex = 0.obs;
  getProductData(title) async {
    storeData.clear();
    var data = await rootBundle.loadString('lib/services/category_model.json');
    var decodedData = categoryModelListFromJson(data);
    var s =
        decodedData.category.where((element) => element.name == title).toList();

    for (var e in s[0].subCategory) {
      storeData.add(e);
    }
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }
}
