import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_in_action/base/button.dart';
import 'package:flutter_in_action/base/check_box.dart';
import 'package:flutter_in_action/base/form.dart';
import 'package:flutter_in_action/base/image.dart';
import 'package:flutter_in_action/base/indicator.dart';
import 'package:flutter_in_action/base/text.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                child: const Text("TextCasePage"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const TextCasePage();
                  }));
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
            }, child: const Text("IndicatorPage"))
          ],
        ),
      ),
    );
  }
}
