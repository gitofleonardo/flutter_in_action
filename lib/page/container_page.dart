import 'package:flutter/material.dart';

class ContainerWidgetPage extends StatelessWidget{
  const ContainerWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: [
          TextButton(
            onPressed: (){
              Navigator.pushNamed(context, "decorated_box_page");
            },
            child: const Text("DecoratedBoxPage"),
          ),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "container_page");
          }, child: const Text("ContainerPage")),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "clip_page");
          }, child: const Text("Clip Page")),
          TextButton(
            onPressed: (){
              Navigator.pushNamed(context, "list_view_page");
            },
            child: const Text("ListViewPage"),
          ),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "animated_list_view_page");
          }, child: const Text("AnimatedListViewPage")),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "grid_view_page");
          }, child: const Text("GridViewPage"))
        ],
      ),
    );
  }
}