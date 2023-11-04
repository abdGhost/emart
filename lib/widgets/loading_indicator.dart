import '../consts/consts.dart';

Widget loadingIndicator({color}) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(color),
    ),
  );
}
