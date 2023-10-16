import '../../consts/consts.dart';
import '../../widgets/app_logo_widget.dart';
import '../../widgets/bg_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWigdet(),
              10.heightBox,
              'Log in to $appname'.text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
              Column()
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
