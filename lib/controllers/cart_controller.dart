import 'package:get/get.dart';

class CartController extends GetxController {
  var totalPrice = 0.obs;

  calculateTotalPrice(data) {
    for (var i = 0; i < data.length; i++) {
      totalPrice = totalPrice + int.parse(data[i]['totalPrice'].toString());
    }
  }
}
