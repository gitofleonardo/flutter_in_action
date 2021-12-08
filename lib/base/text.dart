import 'package:flutter/material.dart';

class TextCasePage extends StatelessWidget{
  const TextCasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextCase"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Hello world",
            textAlign: TextAlign.start,
          ),
          Text(
            "Hello world" * 10,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            "Hello world",
            textScaleFactor: 1.5,
          ),
          const Text(
            "Hello world",
            style: TextStyle(
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