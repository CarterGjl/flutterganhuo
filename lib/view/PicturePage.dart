import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutterlearning/bean/Picture.dart';
import 'package:flutterlearning/model/PictureModel.dart';
import 'package:flutterlearning/view/common/LoadingView.dart';
import 'package:provider/provider.dart';

class PicturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PictureState();
  }
}

class PictureState extends State<PicturePage>
    with AutomaticKeepAliveClientMixin {
  List<PictureBean> datas = [];
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    getPicture(1, 15);
    // datas = pictureModel.datas;

  }

  void getPicture(int page, int count) {
    get(page, count).then((value) => {
          setState(() {
            if (value != null) {
              if (_currentPage > 1) {
                datas += value;
              } else {
                datas = value;
              }
            }
          })
        });
  }

  Future<List<PictureBean>?> get(int page, int count) async {
    var dio = Dio();
    // Response response =  await dio.get("https://wanandroid"
    // ".com/user_article/list/1/json");
    String baseUrl = "https://gank.io/api/v2/";
    String picpath = "data/category/Girl/type/Girl/page/$page/count/$count";
    Response response = await dio.get(baseUrl + picpath);
    var data = jsonDecode(response.toString());
    var pictureResult = PictureResult.fromMap(data);
    print('pic result ${response.data}');
    return pictureResult.data;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Provider<PictureModel>(
        create: (BuildContext context) {
          return Provider.of<PictureModel>(context);
        },
        child: LoadingView(
          loading: datas.length == 0,
          child: EasyRefresh(
            onRefresh: () async {
              _refresh();
            },
            onLoad: () async {
              _load();
            },
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: datas.length,
              itemBuilder: (context, index) {
                var data = datas[index];
                return GestureDetector(
                  onLongPress: () {
                    print('${data.title}');
                  },
                  child: Column(
                    children: [
                      FadeInImage.assetNetwork(
                        image: data.url!,
                        placeholder: "images/loading.gif",
                      ),
                      Text(data.desc ?? "")
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _refresh() async {
    _currentPage = 1;
    getPicture(_currentPage, 15);
  }

  void _load() async {
    _currentPage += 1;
    getPicture(_currentPage, 15);
  }

  Widget show(List<PictureBean>? datas) {
    if (datas == null) {
      return UnconstrainedBox(
        child: Container(child: CircularProgressIndicator()),
      );
    }
    return EasyRefresh(
      onRefresh: () async {
        _refresh();
      },
      onLoad: () async {
        _load();
      },
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: datas.length,
        itemBuilder: (context, index) {
          var data = datas[index];
          return Column(
            children: [
              FadeInImage.assetNetwork(
                image: data.url ?? "",
                placeholder: "images/loading.gif",
              ),
              Text(data.desc ?? "")
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
