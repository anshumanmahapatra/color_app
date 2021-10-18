import 'package:color_app/controller/controller.dart';
import 'package:color_app/models/color_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RandomColor extends StatelessWidget {
  const RandomColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Color Generator"),
        centerTitle: true,
        elevation: 0.0,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.mediaQuery.size.width,
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text("Tap the Button below to Generate Random Color"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text("Generate Color"),
                onPressed: () {
                  controller.changeColor();
                  controller.getColorDetails(controller.colorCode.value);
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10)),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return Offstage(
                  offstage: controller.colorCode.value == "",
                  child: FutureBuilder<ColorDetailsModel>(
                    future: controller.colorDetails,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active ||
                          snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          debugPrint("We got an Error. That error is:");
                          debugPrint(snapshot.error.toString());
                          return Text(snapshot.error.toString());
                        } else {
                          debugPrint("Got the data");
                          return Column(
                            children: [
                              Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(int.parse("0xFF" +
                                          controller.colorCode.value))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(snapshot.data!.name,
                                          style: TextStyle(
                                              color: Color(int.parse("0xFF" +
                                                  snapshot.data!.contrast
                                                      .substring(1))))),
                                      const SizedBox(height: 10),
                                      Text(snapshot.data!.hex,
                                          style: TextStyle(
                                              color: Color(int.parse("0xFF" +
                                                  snapshot.data!.contrast
                                                      .substring(1))))),
                                    ],
                                  )),
                              const SizedBox(height: 10),
                              ListTile(
                                leading: Text(
                                  snapshot.data!.rgb
                                      .substring(0, 3)
                                      .toUpperCase(),
                                ),
                                trailing: Text(snapshot.data!.rgb.substring(
                                    4, snapshot.data!.rgb.length - 1)),
                              ),
                              const SizedBox(height: 10),
                              ListTile(
                                leading: Text(
                                  snapshot.data!.hsl
                                      .substring(0, 3)
                                      .toUpperCase(),
                                ),
                                trailing: Text(snapshot.data!.hsl.substring(
                                    4, snapshot.data!.hsl.length - 1)),
                              ),
                              const SizedBox(height: 10),
                              ListTile(
                                leading: Text(
                                  snapshot.data!.hsv
                                      .substring(0, 3)
                                      .toUpperCase(),
                                ),
                                trailing: Text(snapshot.data!.hsv.substring(
                                    4, snapshot.data!.hsv.length - 1)),
                              ),
                              const SizedBox(height: 10),
                              ListTile(
                                leading: Text(
                                  snapshot.data!.cmyk
                                      .substring(0, 4)
                                      .toUpperCase(),
                                ),
                                trailing: Text(snapshot.data!.cmyk.substring(
                                    5, snapshot.data!.cmyk.length - 1)),
                              ),
                              const SizedBox(height: 10),
                              ListTile(
                                leading: Text(
                                  snapshot.data!.xyz.substring(0, 3),
                                ),
                                trailing: Text(snapshot.data!.xyz.substring(
                                    4, snapshot.data!.xyz.length - 1)),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        }
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        debugPrint("Waiting for data");
                        return const CircularProgressIndicator();
                      } else {
                        debugPrint("We got nothing to show");
                        return Container();
                      }
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
