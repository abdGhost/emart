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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Shipping Address'.text.fontFamily(bold).make(),
                      '${data['order_by_name']}'.text.make(),
                      '${data['order_by_email']}'.text.make(),
                      '${data['order_by_address']}'.text.make(),
                      '${data['order_by_city']}'.text.make(),
                      '${data['order_by_state']}'.text.make(),
                      '${data['order_by_phone']}'.text.make(),
                      '${data['order_by_postalCode']}'.text.make(),
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Total Amount'.text.fontFamily(semibold).color(darkFontGrey).make(),
                        '${data['total_amount']}'.text.fontFamily(bold).color(redColor).make(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
