import '../../consts/consts.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: "Cart is Empty".text.fontFamily(semibold).color(darkFontGrey).makeCentered(),
      ),
    );
  }
}
