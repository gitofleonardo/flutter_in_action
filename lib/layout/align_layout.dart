import 'package:flutter/material.dart';

class AlignLayoutPage extends StatelessWidget{
  const AlignLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Align Layout Page"),elevation: 10,),
      body: Padding(padding: const EdgeInsets.all(10),child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(color: Colors.red,width: 100,height: 100,),
        ),
      )),
    );
  }

}