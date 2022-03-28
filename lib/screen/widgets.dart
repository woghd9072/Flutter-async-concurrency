import 'package:async_concurrency_demo/controller/counter_controller.dart';
import 'package:async_concurrency_demo/controller/isolate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget mainPage(String title) {
  final CounterController counterController = Get.put(CounterController());
  final IsolateController isolateController = Get.put(IsolateController());

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
          ElevatedButton(
            onPressed: () async {
              var list = await isolateController.loadJsonInAnotherIsolate();
              counterController.count.value += list.length;
            },
            child: const Text("Isolate"),
          ),
          ElevatedButton(
            onPressed: () {
              Future.delayed(const Duration(seconds: 3), () async {
                var list = await isolateController.parseJson();
                counterController.count.value += list.length;
              });
            },
            child: const Text("Async"),
          ),
        ],
      ),
    ),
  );
}

