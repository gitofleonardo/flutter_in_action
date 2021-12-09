import 'package:flutter/material.dart';

class StackLayoutPage extends StatelessWidget{
  const StackLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = Container(color: Colors.red,width: 100,height: 100,);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack Layout Page"),
      ),
      body: Padding(padding: const EdgeInsets.all(10.0),child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: widget,
              top: 10,
              right: 20,
            ),
            Positioned(
              child: widget,
              bottom: 10,
              right: 20,
            ),
            widget,
          ],
        ),
      )
      ),
    );
  }

}