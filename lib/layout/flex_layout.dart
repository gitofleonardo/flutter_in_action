import 'package:flutter/material.dart';

class FlexLayoutPage extends StatelessWidget{
  const FlexLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flex Page")),
      body: Padding(padding: const EdgeInsets.all(10.0),child: Column(
        children: [
          Flex(direction: Axis.horizontal,children: [
            Expanded(child: Container(
              height: 30.0,
              color: Colors.blue,
            ),flex: 1,),
            Expanded(child: Container(
              height: 30.0,
              color: Colors.red,
            ),flex: 2,)
          ])
        ],
      ),),
    );
  }
}