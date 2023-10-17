import '../../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: context.screenHeight,
      width: context.screenWidth,
      color: lightGrey,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: whiteColor,
                  filled: true,
                  hintText: searchAnything,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
