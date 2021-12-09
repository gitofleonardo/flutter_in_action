import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatelessWidget{
  const DecoratedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Decorated Box Page"),),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(2,2)
                  )
                ],
                gradient: const LinearGradient(
                  colors: [
                    Colors.deepOrange,
                    Colors.orange
                  ]
                ),
                borderRadius: BorderRadius.circular(5)
              ),
              child: TextButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Click Decorated Box"),duration: Duration(milliseconds: 300),));
              }, child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text("A Decorated Button",style: TextStyle(
                    color: Colors.white
                )),
              )),
            )
          ],
        ),
      ),
    );
  }
}