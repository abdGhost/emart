import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/home_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalPrice = 0.obs;

  var paymentIndex = 0.obs;

  //TextEditing Controller for Shopping cart
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late dynamic productSnapshot;
  var products = [];

  var placingOrder = false.obs;

  calculateTotalPrice(data) {
    totalPrice.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalPrice.value = totalPrice.value + int.parse(data[i]['totalPrice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    placingOrder(true);
    await getProductDetails();

    await firebaseFirestore.collection('orders').doc().set({
      'order_code': "233981237",
      'order_date': FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      'order_by_name': Get.find<HomeController>().userName,
      'order_by_email': currentUser!.email,
      'order_by_address': addressController.text,
      'order_by_state': stateController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      'order_by_postalCode': postalCodeController.text,
      'shipping_method': "Home Delivery",
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_confirmed': false,
      'order_deliveried': false,
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products),
    });
    placingOrder(false);
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'color': productSnapshot[i]['color'],
        'image': productSnapshot[i]['image'],
        'quantity': productSnapshot[i]['quantity'],
        'vendor_id': productSnapshot[i]['vendor_id'],
        'totalPrice': productSnapshot[i]['totalPrice'],
        'title': productSnapshot[i]['titile'],
      });
    }
  }

  clearCart() async {
    for (var i = 0; i < productSnapshot.length; i++) {
      await firebaseFirestore.collection(cartCollection).doc(productSnapshot[i].id).delete();
    }
  }
}
