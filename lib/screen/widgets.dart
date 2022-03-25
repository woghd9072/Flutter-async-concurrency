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

Widget asyncPage() {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Async Test"),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3), () {
              return Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg');
            }),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: snapshot.data,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder(
            future: Future.delayed(const Duration(seconds: 5), () {
              return Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
            }),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: snapshot.data,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    ),
  );
}
