import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget{
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container Page"),
      ),
      body: Container(
        child: const Text("Hello Container"),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Colors.orange,
            Colors.deepOrange
          ]),
          borderRadius: BorderRadius.circular(10)
        ),
        transform: Matrix4.rotationZ(.1),
        alignment: Alignment.center,
        constraints: const BoxConstraints.expand(),
      ),
      backgroundColor: Colors.blue,
    );
  }
}