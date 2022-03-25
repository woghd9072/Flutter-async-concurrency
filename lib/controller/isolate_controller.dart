import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class IsolateController extends GetxController {
  Future<String> _loadJson() {
    return rootBundle.loadString("assets/sample.json");
  }

  Future<List> loadJsonInAnotherIsolate() async {
    var json = await _loadJson();

    return compute(parseJsonInAnotherIsolate, json);
  }

  List parseJsonInAnotherIsolate(String json) {
    HashMap<String, List<dynamic>> jsonData = HashMap.from(jsonDecode(json));
    var list = jsonData["organization"];
    return list!;
  }
}