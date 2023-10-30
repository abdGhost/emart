import 'package:emart_app/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var storeData = [];

  //For Selecting the Color
  var colorIndex = 0.obs;

  var totalPrice = 0.obs;

  //Get All Product Details
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

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  addToCart(
      {titile,
      image,
      sellerName,
      color,
      quantity,
      totalPrice,
      id,
      context}) async {
    await firebaseFirestore.collection(cartCollection).doc().set({
      'titile': titile,
      'image': image,
      'sellerName': sellerName,
      'color': color,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'id': id,
    }).catchError((e) {
      VxToast.show(context, msg: e.toString());
    });
  }

  resetProductValue() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
  }
}
