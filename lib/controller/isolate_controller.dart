import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class IsolateController extends GetxController {
  final JsonDecoder decoder = const JsonDecoder();

  var widgets = ListView().obs;

  Future<List> loadJson() async {
    var json = await rootBundle.loadString("assets/sample.json");
    HashMap<String, List<dynamic>> jsonData = HashMap.from(jsonDecode(json));
    var list = jsonData["organization"];
    return list!;
  }
}