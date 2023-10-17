import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets/bg_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String? titile;
  const CategoryDetailsScreen({
    super.key,
    required this.titile,
  });
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: titile!.text.fontFamily(bold).make(),
      ),
    ));
  }
}
