import 'package:async_concurrency_demo/screen/widgets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return mainPage(title);
  }
}

// TODO
class AsyncPage extends StatelessWidget {
  const AsyncPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class IsolatePage extends StatelessWidget {
  const IsolatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isolatePage();
  }
}