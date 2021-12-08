import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget{
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ButtonCase"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){

              },
              child: const Text("Elevated Button"),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.ac_unit))
          ],
        ),
      )
    );
  }
}