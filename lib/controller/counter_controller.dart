import 'package:get/get.dart';

class CounterController extends GetxController {
  final count = 0.obs;

  void increase() {
    count.value++;
  }

  void decrease() {
    count.value--;
  }
}