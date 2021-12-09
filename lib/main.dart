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
import 'package:flutter_in_action/container/clip_page.dart';
import 'package:flutter_in_action/container/container.dart';
import 'package:flutter_in_action/container/decorated_box.dart';
import 'package:flutter_in_action/dialogs.dart';
import 'package:flutter_in_action/layout/align_layout.dart';
import 'package:flutter_in_action/layout/column_and_row.dart';
import 'package:flutter_in_action/layout/constrained_box.dart';
import 'package:flutter_in_action/layout/flex_layout.dart';
import 'package:flutter_in_action/layout/layout_builder.dart';
import 'package:flutter_in_action/layout/stack_layout.dart';
import 'package:flutter_in_action/layout/wrap.dart';
import 'package:flutter_in_action/page/base_widget_page.dart';
import 'package:flutter_in_action/page/container_page.dart';
import 'package:flutter_in_action/page/layout_widget_page.dart';
import 'package:flutter_in_action/scrollable/animated_list_view.dart';
import 'package:flutter_in_action/scrollable/grid_view.dart';
import 'package:flutter_in_action/scrollable/list_view.dart';

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
      home: const MyHomePage(title: "Home"),
      routes: {
        "button_page": (context) => const ButtonPage(),
        "check_box_page": (context) => const CheckBoxPage(),
        "form_page": (context) => const FormPage(),
        "image_page": (context) => const ImagePage(),
        "indicator_page": (context) => const IndicatorPage(),
        "text_page": (context) => const TextCasePage(),
        "constrained_box": (context) => const ConstrainedBoxPage(),
        "column_row_page": (ctx) => const ColumnRowPage(),
        "flex_page": (ctx) => const FlexLayoutPage(),
        "wrap_page": (ctx) => const WrapPage(),
        "stack_page": (ctx) => const StackLayoutPage(),
        "align_page": (ctx) => const AlignLayoutPage(),
        "layout_builder_page": (ctx) => LayoutBuilderPage(),
        "decorated_box_page": (ctx) => const DecoratedBoxPage(),
        "container_page": (ctx) => const ContainerPage(),
        "clip_page": (ctx) => const ClipPage(),
        "list_view_page": (ctx) => const ListViewPage(),
        "animated_list_view_page": (ctx) => const AnimatedListViewPage(),
        "grid_view_page": (ctx) => const GridViewPage(),
        "dialog_page": (ctx) => const Dialogs(),
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
  DateTime? _lastPress;
  var _currentPageIndex = 0;
  final _pageController = PageController();
  final _pages = [
    const BaseWidgetPage(),
    const LayoutWidgetPage(),
    const ContainerWidgetPage()
  ];
  final _optionalThemes = <ThemeData>[
    ThemeData(primarySwatch: Colors.blue),
    ThemeData(primarySwatch: Colors.deepOrange),
    ThemeData(primarySwatch: Colors.teal)
  ];
  var _currThemeIndex = 0;

  Future<void> fetchAll() async {
    await FlutterDisplayMode.setHighRefreshRate();
    setState(() {});
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
    return Theme(
      data: _optionalThemes[_currThemeIndex],
      child: WillPopScope(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(widget.title),
                ),
                body: Container(
                  constraints: const BoxConstraints.expand(),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _pages[index];
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentPageIndex,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Base"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.list), label: "Layout"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.all_inbox), label: "Container"),
                  ],
                  onTap: (index) {
                    setState(() {
                      _currentPageIndex = index;
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.decelerate);
                    });
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _currThemeIndex =
                          (_currThemeIndex + 1) % _optionalThemes.length;
                    });
                  },
                  child: const Icon(Icons.palette, color: Colors.white),
                ),
              ),
              value: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent)),
          onWillPop: () async {
            if (_lastPress == null ||
                DateTime.now().difference(_lastPress!) >
                    const Duration(seconds: 1)) {
              _lastPress = DateTime.now();
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Press Back Again To Exit")));
              return false;
            }
            return true;
          }),
    );
  }
}
