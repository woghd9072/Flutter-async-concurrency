import 'package:async_concurrency_demo/controller/counter_controller.dart';
import 'package:async_concurrency_demo/controller/isolate_controller.dart';
import 'package:async_concurrency_demo/model/organization.dart';
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
          ElevatedButton(
              onPressed: () => Get.toNamed('/isolate'),
              child: const Text("Isolate"),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed('/async'),
            child: const Text("Async"),
          ),
          const Text("This is Async"),
        ],
      ),
    ),
  );
}

Widget isolatePage() {
  final IsolateController isolateController = Get.put(IsolateController());

  return Scaffold(
    appBar: AppBar(
      title: const Text("Isolate Test"),
    ),
    // Isolate 분리
    body: FutureBuilder(
      future: isolateController.loadJsonInAnotherIsolate(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List list = snapshot.data;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              var org = Organization.fromJson(list[index]);
              return ListTile(
                title: Text("${org.orgName}"),
                subtitle: Text("${org.orgCode}"),
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ),
    backgroundColor: Colors.white,
  );
}
