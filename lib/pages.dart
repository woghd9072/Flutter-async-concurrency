import 'package:async_concurrency_demo/screen/screens.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(name: '/async', page: () => const AsyncPage()),
    GetPage(name: '/isolate', page: () => const AsyncPage()),
  ];
}