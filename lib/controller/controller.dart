import 'dart:async';

import 'package:color_app/models/color_details_model.dart';
import 'package:color_app/services/color_details_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class Controller extends GetxController {
  @override
  void onClose() {
    redController.close();
    greenController.close();
    blueController.close();
    super.onClose();
  }

  @override
  void onInit() {
    currentIndex.value = 0;
    redSliderValue.value = 0.0;
    greenSliderValue.value = 0.0;
    blueSliderValue.value = 0.0;
    rgbColorCode.value = "FFFFFF";
    super.onInit();
  }

  ColorDetailsApi colorDetailsApi = Get.put(ColorDetailsApi());
  var redController = TextEditingController(text: "0").obs;
  var greenController = TextEditingController(text: "0").obs;
  var blueController = TextEditingController(text: "0").obs;
  var redSliderValue = 0.0.obs;
  var greenSliderValue = 0.0.obs;
  var blueSliderValue = 0.0.obs;
  var colorCode = "".obs;
  var rgbColorCode = "".obs;
  var currentIndex = 0.obs;
  var shouldHideRGB = true.obs;
  Future<ColorDetailsModel>? colorDetails;
  // StreamSubscription<ColorDetailsModel>? dataSub;

  changeCurrentIndex(int val) {
    currentIndex.value = val;
    setAllToDefault();
  }

  // listenToStream() {
  //   dataSub = colorDetails!.asStream().listen((event) {});
  // }

  // Future<void> cancelSubscription() async{
  //   return await dataSub!.cancel();
  // }

  setAllToDefault() {
    shouldHideRGB.value = true;
    changeRedValue(0.0);
    changeGreenValue(0.0);
    changeBlueValue(0.0);
    setRedControllerValue("0");
    setGreenControllerValue("0");
    setBlueControllerValue("0");
    setColorCodeToDefault();
  }

  getColorDetails(String colorCode) {
    colorDetails = colorDetailsApi.getColorDetails(colorCode);
  }

  changeRedValue(double val) {
    redSliderValue.value = val;
  }

  changeGreenValue(double val) {
    greenSliderValue.value = val;
  }

  changeBlueValue(double val) {
    blueSliderValue.value = val;
  }

  setRedControllerValue(String val) {
    redController.value.text = val;
  }

  setGreenControllerValue(String val) {
    greenController.value.text = val;
  }

  setBlueControllerValue(String val) {
    blueController.value.text = val;
  }

  changeColor({int code = 0}) {
    if (code == 1) {
      shouldHideRGB.value = false;
    } else {
      shouldHideRGB.value = true;
    }
    String? r, g, b;
    String? pseudoColor;
    if (currentIndex.value == 0) {
      r = randomToHex(randomBetween(0, 255));
      g = randomToHex(randomBetween(0, 255));
      b = randomToHex(randomBetween(0, 255));
    } else {
      r = randomToHex(int.parse(redSliderValue.value.toInt().toString()));
      g = randomToHex(int.parse(greenSliderValue.value.toInt().toString()));
      b = randomToHex(int.parse(blueSliderValue.value.toInt().toString()));
    }
    pseudoColor = r + g + b;
    if (currentIndex.value == 0) {
      colorCode.value = pseudoColor;
    } else {
      rgbColorCode.value = pseudoColor;
    }
    if (currentIndex.value == 0) {
      debugPrint("First Screen Color Code: " + colorCode.value);
    }
  }

  setColorCodeToDefault() {
    colorCode.value = "";
    rgbColorCode.value = "";
  }

  String randomToHex(int num) {
    String? finalText;
    int quotient = quotientFinder(num);
    int remainder = remainderFinder(num);
    if (quotient > 9 && remainder > 9) {
      finalText = String.fromCharCode(quotient + 55) +
          String.fromCharCode(remainder + 55);
      return finalText;
    } else if (quotient <= 9 && remainder > 9) {
      finalText = quotient.toString() + String.fromCharCode(remainder + 55);
      return finalText;
    } else if (quotient > 9 && remainder <= 9) {
      finalText = String.fromCharCode(quotient + 55) + remainder.toString();
      return finalText;
    } else {
      finalText = quotient.toString() + remainder.toString();
      return finalText;
    }
  }

  int quotientFinder(int num) {
    int quotient = num ~/ 16;
    return quotient;
  }

  int remainderFinder(int num) {
    int remainder = num % 16;
    return remainder;
  }
}
