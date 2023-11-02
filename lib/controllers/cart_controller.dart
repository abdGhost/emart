import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalPrice = 0.obs;

  //TextEditing Controller for Shopping cart
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  calculateTotalPrice(data) {
    totalPrice.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalPrice.value = totalPrice.value + int.parse(data[i]['totalPrice'].toString());
    }
  }
}
