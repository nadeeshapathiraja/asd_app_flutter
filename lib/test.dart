import 'package:flutter/material.dart';

class TestVideo extends StatefulWidget {
  TestVideo({
    Key? key,
  }) : super(key: key);

  @override
  State<TestVideo> createState() => _TestVideoState();
}

class _TestVideoState extends State<TestVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
      ),
    );
  }
}
