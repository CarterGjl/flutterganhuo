import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearning/bean/Banner.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  int _counter = 0;
  List<BannerBean>? banners;

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('initState');
    get().then((value) => {
          setState(() {
            banners = value;
          }),
          print('result ${value.toString()}')
        });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Future<List<BannerBean>?> get() async {
    var dio = Dio();
    // Response response =  await dio.get("https://wanandroid"
    // ".com/user_article/list/1/json");
    Response response = await dio.get("https://gank.io/api/v2/banners");
    var data = jsonDecode(response.toString());
    var bannerResult = BannerResult.fromMap(data);
    return bannerResult.data;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Container(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: banners?.length ?? 0,
          itemBuilder: (context, index) {
            var banner = banners?[index];
            if (banner == null) {
              return Text("null");
            }
            return BannerWidget(banner: banner);
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
    required this.banner,
  }) : super(key: key);

  final BannerBean banner;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${banner.title}'),
        FadeInImage.assetNetwork(
          image: banner.image!,
          placeholder: "images/loading.gif",
        ),
      ],
    );
  }
}
