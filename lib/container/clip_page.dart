import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipPage extends StatefulWidget{
  const ClipPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ClipPage> with SingleTickerProviderStateMixin{
  late AnimationController _animController;
  var _expand = false;

  @override
  void initState() {
    _animController = AnimationController(vsync: this,duration: const Duration(milliseconds: 250),lowerBound: 10.0,upperBound: 100.0);
    _animController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = Image.asset("assets/images/image.png",width: 100,height: 100,fit: BoxFit.cover,);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clip Page"),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            image,
            ClipOval(
              child: image,
            ),
            GestureDetector(
              onTap: (){
                if (_expand){
                  _animController.reverse();
                }else{
                  _animController.forward();
                }
                _expand = !_expand;
              },
              child: ClipRRect(
                child: image,
                borderRadius: BorderRadius.circular(_animController.value),
              ),
            )
          ],
        ),
      ),
    );
  }
}