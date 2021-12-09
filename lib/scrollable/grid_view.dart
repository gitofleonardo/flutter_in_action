import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget{
  const GridViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<GridViewPage>{
  final _items = <IconData>[
    Icons.construction,
    Icons.ac_unit,
    Icons.access_alarm_outlined,
    Icons.account_balance_rounded,
    Icons.seventeen_mp
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Page")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1
          ),
          itemCount: _items.length,
          itemBuilder: (ctx,index){
            return Icon(_items[index],color: Colors.blue);
          },
        ),
      ),
    );
  }
}