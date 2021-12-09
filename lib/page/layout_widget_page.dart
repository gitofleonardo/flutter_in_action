import 'package:flutter/material.dart';

class LayoutWidgetPage extends StatelessWidget{
  const LayoutWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: [
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "constrained_box");
          }, child: const Text("ConstrainedBox")),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "column_row_page");
          }, child: const Text("ColumnAndRowPage")),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "flex_page");
          }, child: const Text("FlexLayout")),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "wrap_page");
          }, child: const Text("WrapLayout")),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "stack_page");
          }, child: const Text("StackLayoutPage")),
          TextButton(
              child: const Text("AlignLayoutPage"),
              onPressed: (){
                Navigator.pushNamed(context, "align_page");
              }
          ),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "layout_builder_page");
          }, child: const Text("LayoutBuilderPage")),
        ],
      ),
    );
  }
}