import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/order_screens/components/order_status.dart';

class OrderDetailsScreen extends StatelessWidget {
  final dynamic data;
  const OrderDetailsScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Order Details'.text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Column(
        children: [
          orderStatus(
            icon: const Icon(Icons.done),
            color: redColor,
            title: 'Order Placed',
            showDone: data['order_placed'],
          )
        ],
      ),
    );
  }
}
