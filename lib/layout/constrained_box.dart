import 'package:flutter/material.dart';

class ConstrainedBoxPage extends StatelessWidget{
  const ConstrainedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Constrained Box Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: double.infinity,
            ),
            child: const Text(
              "Hello Text",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

}