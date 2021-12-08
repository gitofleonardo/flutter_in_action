import 'package:flutter/material.dart';

class ColumnRowPage extends StatelessWidget{
  const ColumnRowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Column And Row Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text("Hello"),
                Text("World"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text("Hello"),
                Text("Thank you"),
                Icon(Icons.contacts)
              ],
            )
          ],
        ),
      ),
    );
  }
}