import 'package:flutter/material.dart';

class IndicatorPage extends StatefulWidget{
  const IndicatorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<IndicatorPage> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Indicator Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LinearProgressIndicator(
              color: Colors.blue,
            ),
            const CircularProgressIndicator(
              color: Colors.blue,
            ),
            LinearProgressIndicator(
              valueColor: ColorTween(begin: Colors.amber,end: Colors.deepOrange).animate(_animationController),
              value: _animationController.value,
            )
          ],
        ),
      ),
    );
  }
}