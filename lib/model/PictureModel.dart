import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearning/bean/Picture.dart';

class PictureModel with ChangeNotifier {
  int _currentPage = 1;
  List<PictureBean> datas = [];

  void increment() {
    notifyListeners();// 通知听众刷新
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

  void getPicture(int page, int count) async {
    var list = await get(page, count);
    if (list != null) {
      if (_currentPage > 1) {
        datas += list;
      } else {
        datas = list;
      }
    }
    _currentPage ++;
    notifyListeners();
  }
}
