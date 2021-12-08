import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_in_action/base/button.dart';
import 'package:flutter_in_action/base/check_box.dart';
import 'package:flutter_in_action/base/form.dart';
import 'package:flutter_in_action/base/image.dart';
import 'package:flutter_in_action/base/indicator.dart';
import 'package:flutter_in_action/base/text.dart';
import 'package:flutter_in_action/layout/column_and_row.dart';
import 'package:flutter_in_action/layout/constrained_box.dart';
import 'package:flutter_in_action/layout/flex_layout.dart';
import 'package:flutter_in_action/layout/wrap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home'),
      routes: {
        "button_page": (context) => const ButtonPage(),
        "check_box_page":(context) => const CheckBoxPage(),
        "form_page": (context) => const FormPage(),
        "image_page": (context) => const ImagePage(),
        "indicator_page": (context) => const IndicatorPage(),
        "text_page": (context) => const TextCasePage(),
        "constrained_box": (context) => const ConstrainedBoxPage(),
        "column_row_page": (ctx) => const ColumnRowPage(),
        "flex_page": (ctx) => const FlexLayoutPage(),
        "wrap_page": (ctx) => const WrapPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final List<DisplayMode> _modes;
  late final DisplayMode? _active;
  late final DisplayMode? _preferred;

  Future<void> fetchAll() async {
    try{
      _modes = await FlutterDisplayMode.supported;
      _modes.forEach(print);
    }catch(e){
      print(e);
    }
    _preferred = await FlutterDisplayMode.preferred;
    _active = await FlutterDisplayMode.active;
    await FlutterDisplayMode.setHighRefreshRate();
    setState(() {

    });
  }

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      fetchAll();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(child: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextButton(
                child: const Text("TextCasePage"),
                onPressed: (){
                  Navigator.pushNamed(context, "text_page",arguments: "Hello World And Thank You.");
                }),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const ButtonPage();
                  }));
                },
                child: const Text("ButtonPage")
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const ImagePage();
              }));
            }, child: const Text("ImagePage")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const CheckBoxPage();
              }));
            }, child: const Text("CheckBoxPage")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const FormPage();
              }));
            }, child: const Text("FormPage")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return const IndicatorPage();
              }));
            }, child: const Text("IndicatorPage")),
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
            }, child: const Text("WrapLayout"))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Base"),
          BottomNavigationBarItem(icon: Icon(Icons.list),label: "Layout"),
          BottomNavigationBarItem(icon: Icon(Icons.all_inbox),label: "Container"),
        ],
      ),
    ), value: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));
  }
}
