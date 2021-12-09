import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget{
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ListViewPage>{
  final _items = <String>[];
  var _currIndex = 0;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData(){
    Future.delayed(const Duration(seconds: 1)).then((value) {
      final endIndex = _currIndex + 10;
      for (var i = _currIndex;i < endIndex;++i){
        setState(() {
          _items.add("Item: $i");
        });
      }
      _currIndex += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: ListView.builder(itemBuilder: (context,index){
            if (index == _items.length - 1){
              _fetchData();
            }
            return ListTile(
              title: Text(_items[index]),
              onTap: (){
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Click Item: ${_items[index]}"))
                );
              },
            );
          },itemCount: _items.length,controller: _scrollController,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_arrow_up),
        onPressed: (){
          _scrollController.animateTo(0, duration: const Duration(milliseconds: 250), curve: Curves.decelerate);
        },
      )
      );
  }
}