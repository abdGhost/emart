import 'package:emart_app/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navbarItems = [
      BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 26,
        ),
        label: home,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icCategories,
          width: 26,
        ),
        label: category,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icCart,
          width: 26,
        ),
        label: cart,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 26,
        ),
        label: account,
      ),
    ];

    var navbarBody = [
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.red),
      Container(color: Colors.black),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx((() => Expanded(
                child: navbarBody.elementAt(controller.currentNavIndex.value),
              )))
        ],
      ),
      bottomNavigationBar: Obx(
        (() => BottomNavigationBar(
              currentIndex: controller.currentNavIndex.value,
              type: BottomNavigationBarType.fixed,
              items: navbarItems,
              selectedItemColor: redColor,
              backgroundColor: whiteColor,
              selectedLabelStyle: const TextStyle(
                fontFamily: bold,
              ),
              onTap: (value) {
                controller.currentNavIndex.value = value;
              },
            )),
      ),
    );
  }
}
