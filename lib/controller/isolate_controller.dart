import 'dart:convert';

import 'package:async_concurrency_demo/model/organization.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class IsolateController extends GetxController {
  final JsonDecoder decoder = const JsonDecoder();

  Future<String> _loadJson() async {
    return await rootBundle.loadString("assets/sample.json");
  }

  parseJson() async {
    var json = await _loadJson();
    var data = jsonDecode(json);
    Organization org = Organization.fromJson(data);

    print(org);
    return org;
  }
}