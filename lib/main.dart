import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlearning/model/PictureModel.dart';
import 'package:flutterlearning/view/ArticlePage.dart';
import 'package:flutterlearning/view/HomePage.dart';
import 'package:flutterlearning/view/PicturePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PictureModel(),)
      ],
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  final pages = [HomePage(), PicturePage(), ArticlePage()];

  final bottomDatas = [
    BottomItemData(Icons.access_alarm, "count"),
    BottomItemData(Icons.account_box, "mine"),
    BottomItemData(Icons.article_sharp, "article")
  ];

  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    var bottomItems = bottomDatas
        .map((e) => BottomNavigationBarItem(
              icon: Icon(e.icon),
              label: e.label,
            ))
        .toList();
    bottomDatas.forEach((element) {
      BottomNavigationBarItem(
        icon: Icon(Icons.access_alarm),
        label: "test",
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => pages[index],
        itemCount: pages.length,
        controller: _controller,
        onPageChanged: (value) => {_pageChange(value)},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        currentIndex: index,
        onTap: (value) {
          _controller.jumpToPage(value);
        },
      ), // This trailing comma makes
    );
  }

  _pageChange(int value) {
    setState(() {
      index = value;
    });
  }
}

class BottomItemData {
  late IconData icon;
  late String label;

  BottomItemData(this.icon, this.label);
}
