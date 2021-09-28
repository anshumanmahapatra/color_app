import 'package:flutter/material.dart';

import '../models/color_details_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ColorDetailsApi {
  Future<ColorDetailsModel> getColorDetails(String colorCode) async {
    debugPrint("Api called");
    final response = await http
        .get(Uri.parse("https://www.thecolorapi.com/id?hex=$colorCode"));
    if (response.statusCode == 200) {
      Map result = jsonDecode(response.body);
      return ColorDetailsModel.fromJson(result);
    } else {
      throw Exception("Could not get the details of the Color generated");
    }
  }
}
