import '../controller/controller.dart';
import 'views/random_color.dart';
import 'views/rbg_to_hex.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PseudoHome(),
    );
  }
}

class PseudoHome extends StatelessWidget {
  const PseudoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    List<Widget> screens = const [
      RandomColor(),
      RGBToHex(),
    ];
    return Obx(() {
      return Scaffold(
          body: screens[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.changeCurrentIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.colorize_outlined), label: "Random Color"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.change_circle_outlined),
                  label: "RGB to Hex"),
            ],
          ));
    });
  }
}
