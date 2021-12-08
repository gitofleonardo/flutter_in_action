

import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget{
  const CheckBoxPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CheckBoxState();
  }
}

class _CheckBoxState extends State<CheckBoxPage>{
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckBox"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Checkbox(
              value: _checked,
              onChanged: (value){
                setState(() {
                  _checked = value??false;
                });
              },
            ),
            Switch(value: _checked, onChanged: (value){
              setState(() {
                _checked = value;
              });
            })
          ],
        ),
      ),
    );
  }
}