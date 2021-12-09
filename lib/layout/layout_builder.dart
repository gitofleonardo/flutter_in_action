import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget{
  LayoutBuilderPage({Key? key}) : super(key: key);
  final _innerChildren = List.filled(20, const Text("Hello world",maxLines: 1,));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Layout Builder Page"),),
      body: LayoutBuilder(builder: (context,constraint){
        if (constraint.maxWidth < 1080){
          return Padding(padding: const EdgeInsets.all(10),child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Column(
              children: _innerChildren,
            ),
          ));
        }else{
          final firstCol = List<Widget>.empty(growable: true);
          final secondCol = List<Widget>.empty(growable: true);
          for (var i = 0;i < _innerChildren.length;++i){
            if (i % 2 == 0){
              firstCol.add(_innerChildren[i]);
            }else{
              secondCol.add(_innerChildren[i]);
            }
          }
          return Padding(padding: const EdgeInsets.all(10),child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Column(
                    children: firstCol,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: secondCol,
                  ),
                )
              ],
            ),
          ));
        }
      }),
    );
  }
}