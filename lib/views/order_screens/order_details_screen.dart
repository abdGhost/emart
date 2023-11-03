import '../../consts/consts.dart';
import '../../views/order_screens/components/order_place_details.dart';
import '../../views/order_screens/components/order_status.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetailsScreen extends StatelessWidget {
  final dynamic data;
  const OrderDetailsScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: 'Order Details'.text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            orderStatus(
              icon: Icons.done,
              color: redColor,
              title: 'Placed'.toString(),
              showDone: data['order_placed'],
            ),
            orderStatus(
              icon: Icons.thumb_up,
              color: Colors.blue,
              title: 'Confirm'.toString(),
              showDone: data['order_confirmed'],
            ),
            orderStatus(
              icon: Icons.card_giftcard,
              color: Colors.yellow,
              title: 'On Delivery'.toString(),
              showDone: data['order_on_delivery'],
            ),
            orderStatus(
              icon: Icons.done_all_outlined,
              color: Colors.purple,
              title: 'Delivered'.toString(),
              showDone: data['order_deliveried'],
            ),
            const Divider(),
            10.heightBox,
            orderPlacedetails(
              title1: 'Order Code',
              detail1: '${data['order_code']}',
              title2: 'Shipping Method',
              details2: '${data['shipping_method']}',
            ),
            orderPlacedetails(
              title1: 'Order Date',
              //For formating date
              detail1: intl.DateFormat().add_yMd().format(data['order_date'].toDate()),
              title2: 'Payment Method',
              details2: '${data['payment_method']}',
            ),
            orderPlacedetails(
              title1: 'Payment Status',
              //For formating date
              detail1: "Unpaid",
              title2: 'Delivery Status',
              details2: 'Order Placed',
            ),
          ],
        ),
      ),
    );
  }
}
