import 'package:async_concurrency_demo/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget mainPage(String title) {
  final CounterController counterController = Get.put(CounterController());

  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You have pushed the button this many times:',
          ),
          Obx(
                () => Text(
              '${counterController.count.value}',
              style: Theme.of(Get.context!).textTheme.headline4,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: IconButton(
                  onPressed: () => counterController.decrease(),
                  icon: const Icon(Icons.remove),
                ),
              ),
              Expanded(
                flex: 5,
                child: IconButton(
                  onPressed: () => counterController.increase(),
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// TODO
class AsyncPage extends StatelessWidget {
  const AsyncPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// TODO
class IsolatePage extends StatelessWidget {
  const IsolatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
