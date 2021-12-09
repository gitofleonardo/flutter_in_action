import 'package:flutter/material.dart';
import 'package:flutter_in_action/base/button.dart';
import 'package:flutter_in_action/base/check_box.dart';
import 'package:flutter_in_action/base/form.dart';
import 'package:flutter_in_action/base/image.dart';
import 'package:flutter_in_action/base/indicator.dart';

class BaseWidgetPage extends StatelessWidget {
  const BaseWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: [
          TextButton(
              child: const Text("TextCasePage"),
              onPressed: () {
                Navigator.pushNamed(context, "text_page",
                    arguments: "Hello World And Thank You.");
              }),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ButtonPage();
                }));
              },
              child: const Text("ButtonPage")),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ImagePage();
                }));
              },
              child: const Text("ImagePage")),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CheckBoxPage();
                }));
              },
              child: const Text("CheckBoxPage")),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FormPage();
                }));
              },
              child: const Text("FormPage")),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return const IndicatorPage();
                }));
              },
              child: const Text("IndicatorPage")),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "dialog_page");
              },
              child: const Text("DialogsPage"))
        ],
      ),
    );
  }
}
