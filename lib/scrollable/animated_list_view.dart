import 'package:flutter/material.dart';

class AnimatedListViewPage extends StatefulWidget{
  const AnimatedListViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<AnimatedListViewPage>{
  final _animatedListStateKey = GlobalKey<AnimatedListState>();
  final _items = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedListView Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimatedList(
          key: _animatedListStateKey,
          initialItemCount: _items.length,
          itemBuilder: (ctx,index,anim){
            return FadeTransition(opacity: anim,child: ListTile(
              title: Text(_items[index]),
            ),);
          }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _items.add("Hello AnimatedList: ${_items.length}");
            _animatedListStateKey.currentState?.insertItem(_items.length - 1,duration: const Duration(milliseconds: 250));
          });
        },
        child: const Icon(Icons.add,color: Colors.white),
      ),
    );
  }
}