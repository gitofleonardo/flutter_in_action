

import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget{
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImageCase"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/image.png",
              height: 200,
              color: Colors.grey,
              colorBlendMode: BlendMode.color,
            ),
            Image.asset("assets/images/image.png",
              height: 200,
              color: Colors.grey,
              colorBlendMode: BlendMode.color,
            ),
            Image.asset("assets/images/image.png",
              height: 200,
              color: Colors.grey,
              colorBlendMode: BlendMode.color,
            ),
            Image.asset("assets/images/image.png",
              height: 200,
              color: Colors.grey,
              colorBlendMode: BlendMode.color,
            ),
            Image.asset("assets/images/image.png",
              height: 200,
              color: Colors.grey,
              colorBlendMode: BlendMode.color,
            ),
          ],
        ),
      ),
    );
  }

}