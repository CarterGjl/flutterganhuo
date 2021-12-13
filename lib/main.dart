import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlearning/meeting/smart_meeting_room.dart';
import 'package:flutterlearning/tcp/TcpChannel.dart';
import 'package:flutterlearning/util/utils.dart';
import 'package:flutterlearning/view/ArticlePage.dart';
import 'package:flutterlearning/view/HomePage.dart';
import 'package:flutterlearning/view/PicturePage.dart';
import 'package:flutterlearning/view/TestPage.dart';
import 'package:flutterlearning/widget/handle_view.dart';
import 'package:provider/provider.dart';

import 'bottom2toprouter.dart';

void main() {
  runApp(const MyApp1());
}

@pragma('vm:entry-point')
void topMain() => runApp(const MyApp1());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const BottomPage(),
    );
  }
}

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const BottomPage(),
      onGenerateRoute: (settings) {
        Uri uri = Uri.parse(settings.name ?? '');
        String route = uri.path;
        Map<String, String> queryParameter = uri.queryParameters;
        switch (route) {
          case "meeting_feedback":
            String srting = Utils.base64Decode(queryParameter["type"]!);
            return PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const BottomPage());
          default:
            return Bottom2TopRouter(child: const SmartMeetingRoom());
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  final pages = [
    HomePage(),
    PicturePage(),
    ArticlePage(),
    ChangeNotifierProvider(
      create: (context) {
        return Counter();
      },
      builder: (context, child) {
        return const TestPage();
      },
    )
  ];

  final List<BottomItemData> bottomDatas = [
    BottomItemData(Icons.access_alarm, "count"),
    BottomItemData(Icons.account_box, "mine"),
    BottomItemData(Icons.article_sharp, "article"),
    BottomItemData(Icons.label, "test")
  ];

  late PageController _controller;

  @override
  void initState() {
    super.initState();
    TcpChannel.initTcpChannel();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bottomItems = bottomDatas
        .map((e) => BottomNavigationBarItem(
              icon: Icon(e.icon),
              label: e.label,
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => pages[index],
        itemCount: pages.length,
        controller: _controller,
        onPageChanged: (value) => {_pageChange(value)},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) {
              return const BottomPage();
            },
          ));
          // TcpChannel.sendCommand(ConfigGetDynamicCommand())
          //     .then((value) => {
          //       print('test ${value.toLog()}')
          //     })
          //     .catchError((error) {
          //   print('test $error');
          // });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.black54,
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

class BottomPage extends StatelessWidget {

  final String? base64decode;

  const BottomPage({this.base64decode, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s =
        "eyJib2R5Ijp7ImNsaV9pbmZvIjp7InNwaWxfc2RrIjoiVjIuMC4xLWUxNDdlZTQifSwiY29u"
        "Zl9pbmZvIjp7fSwiY3B1X21lbV9pbmZvIjp7ImFwcF9jcHVfdXNhZ2UiOjAsImFwcF9t"
        "ZW1fdXNhZ2UiOjQ1Mywic3lzX2NwdV91c2FnZSI6MCwic3lzX21lbV91c2FnZSI6NTIz"
        "MiwidG90YWxfbWVtIjo3NDU5fSwiZGV2aWNlX2luZm8iOnsiY3B1X251bSI6OCwiZGV2X2luZm8iOiJTTS1HOTczMCIsImdwdV9pbmZvIjoiIiwic3lzX3R5cGUiOiJhbmRyb2lkIiwic3lzX3ZlcnNpb24iOiIxMSIsInRvdGFsX21lbSI6NzQ1OX0sIm5ldHdvcmtfaW5mbyI6eyJhcF9kZXNjIjoidW5rbm93biBzc2lkIiwiZGVsYXkiOiIiLCJsb2NhbF9pcCI6IjE3Mi4yMS4yMjguMTAyIiwibmV0X2Rlc2MiOiIiLCJuZXRfdHlwZSI6IldpLUZpIiwicmVjdl9sb3N0X3JhdGUiOiIiLCJzZGtfY3RsX2FkZHIiOiIyMjAuMTgxLjExMS43NDo5MDAwIiwic2RrX21lZGlhX2FkZHIiOiJbMjIwLjE4MS4xMTEuNzRdOls5NjAwLCA5NjAyLCA5NjA0LCA5NjA2XSIsInNlbmRfbG9zdF9yYXRlIjoiIn0sInRyYWNlSWQiOiI4MTc1OTE0MTVfMTgyMDM5MTFfMTYzODk0MzQ5MjI3OSIsInVwbG9hZCI6MCwidXNlcl9pbmZvIjp7ImFjY291bnQiOiJCcnV0YWxmcmVlIiwiZW1haWwiOiIiLCJ1aWQiOjgxNzU5MTQxNX19LCJoZWFkIjp7ImFjdGlvbiI6InZvaXBfZmVlZGJhY2siLCJhY3Rpb25fdGltZSI6MTYzODk0MzQ5MjI3OSwiYXBuIjoiMDAwMDAiLCJhcHBfc3RhdHVzIjoxLCJjbGllbnRfcGxhdGZvcm1faWQiOjgsImNsaWVudF92ZXJzaW9uIjoiOCwxOCwyLDAiLCJjb3JwX2lkIjoxLCJkZXZpY2UiOiJTTS1HOTczMHwxMXwwMjowMDowMDowMDowMDowMCIsImRldmljZV9pbWVpIjoiIiwiaW5uZXIiOjEsIm5ldHdvcmtfbmFtZSI6InVua25vd24gc3NpZCIsIm5ldHdvcmtfdHlwZSI6MiwidXNlcl9pZCI6ODE3NTkxNDE1LCJ2aXNpYmxlX2lwIjo4MTkzODM5MTl9fQ==";
    var base64decode = Utils.base64Decode(s);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("data"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30,left: 30),
        child: HandleWidget(
          onHandleListener: (direction) {
            print('direction $direction');
          },
        ),
      ),
      // bottomSheet: Column(
      //   children: [
      //     const HandleWidget(),
      //     BottomSheet(
      //       backgroundColor: Colors.transparent,
      //       onClosing: () {},
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(20.0),
      //       ),
      //       onDragEnd: (details, {isClosing = true}) {
      //         Navigator.of(context).pop();
      //         SystemNavigator.pop(animated: true);
      //       },
      //       enableDrag: true,
      //       builder: (context) {
      //         return Container(
      //           width: double.infinity,
      //
      //           // color: Colors.grey.shade200,
      //           alignment: Alignment.center,
      //           decoration: const BoxDecoration(
      //             borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(21),
      //                 topRight: Radius.circular(21)),
      //             color: Colors.white,
      //           ),
      //           child: ElevatedButton(
      //             child: const Text("Close Bottom Sheet"),
      //             style: ElevatedButton.styleFrom(
      //               onPrimary: Colors.white,
      //               primary: Colors.green,
      //             ),
      //             onPressed: () {
      //               SystemNavigator.pop(animated: true);
      //               Navigator.of(context).pop();
      //             },
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
