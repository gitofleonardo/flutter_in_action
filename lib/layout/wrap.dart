import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget{
  const WrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flow Layout Page"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 5.0,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Hello")));
              },
              child: const Chip(label: Text("Hello")),
            ),
            Chip(label: Text("world")),
            Chip(label: Text("and")),
            Chip(label: Text("thank")),
            Chip(label: Text("you")),
            Chip(label: Text("very")),
            Chip(label: Text("much")),
          ],
        ),
      ),
    );
  }
}