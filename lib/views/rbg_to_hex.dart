import 'package:color_app/controller/controller.dart';
import 'package:color_app/models/color_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RGBToHex extends StatelessWidget {
  const RGBToHex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: const Text("RGB to Hex Converter"),
        centerTitle: true,
        elevation: 0.0,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Obx(() {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        controller: controller.redController.value,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Red",
                          hintText: "Enter a number between 0-255",
                        ),
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            if (double.parse(val) > 255) {
                              controller.changeRedValue(255.0);
                              controller.setRedControllerValue("255");
                              controller.changeColor();
                            } else if (double.parse(val) < 0) {
                              controller.changeRedValue(0.0);
                              controller.setRedControllerValue("0");
                              controller.changeColor();
                            } else {
                              controller.changeRedValue(double.parse(val));
                              controller.changeColor();
                            }
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (controller.redSliderValue.value.toInt() < 255) {
                              controller.changeRedValue(
                                  controller.redSliderValue.value + 1.0);
                              controller.setRedControllerValue(
                                  controller.redSliderValue.toInt().toString());
                              controller.changeColor();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(5),
                          ),
                          child: const Icon(Icons.arrow_upward_outlined)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (controller.redSliderValue.value.toInt() > 0) {
                              controller.changeRedValue(
                                  controller.redSliderValue.value - 1.0);
                              controller.setRedControllerValue(
                                  controller.redSliderValue.toInt().toString());

                              controller.changeColor();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(5),
                          ),
                          child: const Icon(Icons.arrow_downward_outlined)),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Slider(
                  value: controller.redSliderValue.value,
                  label: controller.redSliderValue.value.round().toString(),
                  onChanged: (val) {
                    controller.changeRedValue(val);
                    controller.setRedControllerValue(val.toInt().toString());
                    controller.changeColor();
                  },
                  divisions: 255,
                  min: 0,
                  max: 255,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        controller: controller.greenController.value,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Green",
                          hintText: "Enter a number between 0-255",
                        ),
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            if (val.isNotEmpty) {
                              if (double.parse(val) > 255) {
                                controller.changeGreenValue(255.0);
                                controller.setGreenControllerValue("255");
                                controller.changeColor();
                              } else if (double.parse(val) < 0) {
                                controller.changeGreenValue(0.0);
                                controller.setGreenControllerValue("0");
                                controller.changeColor();
                              } else {
                                controller.changeGreenValue(double.parse(val));
                                controller.changeColor();
                              }
                            }
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (controller.greenSliderValue.value.toInt() <
                                255) {
                              controller.changeGreenValue(
                                  controller.greenSliderValue.value + 1.0);
                              controller.setGreenControllerValue(controller
                                  .greenSliderValue
                                  .toInt()
                                  .toString());
                              controller.changeColor();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(5),
                          ),
                          child: const Icon(Icons.arrow_upward_outlined)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (controller.greenSliderValue.value.toInt() > 0) {
                              controller.changeGreenValue(
                                  controller.greenSliderValue.value - 1.0);
                              controller.setGreenControllerValue(controller
                                  .greenSliderValue
                                  .toInt()
                                  .toString());

                              controller.changeColor();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(5),
                          ),
                          child: const Icon(Icons.arrow_downward_outlined)),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Slider(
                  value: controller.greenSliderValue.value,
                  label: controller.greenSliderValue.value.round().toString(),
                  onChanged: (val) {
                    controller.changeGreenValue(val);
                    controller.setGreenControllerValue(val.toInt().toString());
                    controller.changeColor();
                  },
                  divisions: 255,
                  min: 0,
                  max: 255,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        controller: controller.blueController.value,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Blue",
                          hintText: "Enter a number between 0-255",
                        ),
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            if (double.parse(val) > 255) {
                              controller.changeBlueValue(255.0);
                              controller.setBlueControllerValue("255");
                              controller.changeColor();
                            } else if (double.parse(val) < 0) {
                              controller.changeBlueValue(0.0);
                              controller.setBlueControllerValue("0");
                              controller.changeColor();
                            } else {
                              controller.changeBlueValue(double.parse(val));
                              controller.changeColor();
                            }
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (controller.blueSliderValue.value.toInt() <
                                255) {
                              controller.changeBlueValue(
                                  controller.blueSliderValue.value + 1.0);
                              controller.setBlueControllerValue(controller
                                  .blueSliderValue
                                  .toInt()
                                  .toString());

                              controller.changeColor();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(5),
                          ),
                          child: const Icon(Icons.arrow_upward_outlined)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (controller.blueSliderValue.value.toInt() > 0) {
                              controller.changeBlueValue(
                                  controller.blueSliderValue.value - 1.0);
                              controller.setBlueControllerValue(controller
                                  .blueSliderValue
                                  .toInt()
                                  .toString());

                              controller.changeColor();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(5),
                          ),
                          child: const Icon(Icons.arrow_downward_outlined)),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Slider(
                  value: controller.blueSliderValue.value,
                  label: controller.blueSliderValue.value.round().toString(),
                  onChanged: (val) {
                    controller.changeBlueValue(val);
                    controller.setBlueControllerValue(val.toInt().toString());
                    controller.changeColor();
                  },
                  divisions: 255,
                  min: 0,
                  max: 255,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text("Get Details"),
                      onPressed: () {
                        controller.changeColor(code: 1);
                        controller
                            .getColorDetails(controller.rgbColorCode.value);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10)),
                    ),
                    ElevatedButton(
                      child: const Text("Reset"),
                      onPressed: () {
                        controller.setAllToDefault();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(
                            int.parse("0xFF" + controller.rgbColorCode.value))),
                  ),
                ),
                controller.shouldHideRGB.value == false
                    ? FutureBuilder<ColorDetailsModel>(
                        future: controller.colorDetails,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.active ||
                              snapshot.connectionState ==
                                  ConnectionState.done) {
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
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Color(int.parse("0xFF" +
                                              controller.rgbColorCode.value))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(snapshot.data!.name,
                                              style: TextStyle(
                                                  color: Color(int.parse(
                                                      "0xFF" +
                                                          snapshot
                                                              .data!.contrast
                                                              .substring(1))))),
                                          const SizedBox(height: 10),
                                          Text(snapshot.data!.hex,
                                              style: TextStyle(
                                                  color: Color(int.parse(
                                                      "0xFF" +
                                                          snapshot
                                                              .data!.contrast
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
                                    trailing: Text(snapshot.data!.cmyk
                                        .substring(
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
                      )
                    : Container(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
