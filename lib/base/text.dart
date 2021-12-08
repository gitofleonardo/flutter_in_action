import 'package:flutter/material.dart';

class TextCasePage extends StatelessWidget{
  const TextCasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = (ModalRoute.of(context)?.settings.arguments??"Hello World") as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextCase"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            arg,
            textAlign: TextAlign.start,
          ),
          Text(
            arg * 10,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            arg,
            textScaleFactor: 1.5,
          ),
          Text(
            arg,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              backgroundColor: Colors.amber,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid
            ),
          ),
          const Text.rich(TextSpan(
            children: [
              TextSpan(
                text: "Hello"
              ),
              TextSpan(
                text: "world",
                style: TextStyle(
                  color: Colors.blue
                ),
              )
            ]
          )),
          DefaultTextStyle(
              style: const TextStyle(
                  color: Colors.deepOrange,
                  backgroundColor: Colors.white
              ),
              child: Column(
                children: const [
                  Text("Hello"),
                  Text("World"),
                  Text("And"),
                  Text("Thank"),
                  Text("You")
                ],
          ))
        ],
      ),
    );
  }
}