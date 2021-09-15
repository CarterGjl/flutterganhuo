import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearning/bean/Article.dart';

import 'WebViewPage.dart';

class ArticlePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ArticlePageState();
  }
}

class ArticlePageState extends State<ArticlePage> {
  List<ArticleBean> result = [];

  Future<List<ArticleBean>?> get() async {
    var dio = Dio();
    Response response = await dio.get(
        "https://gank.io/api/v2/data/category/GanHuo/type/Android/page/1"
            "/count/30");
    print('result ${response.toString()}');
    var data = jsonDecode(response.toString());
    var bannerResult = ArticleResult.fromMap(data);
    return bannerResult.data;
  }

  @override
  void initState() {
    super.initState();
    get().then((value) => {
          setState(() {
            result = value!;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: result.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ArticleItem(result[index]);
      },
    );
  }
}

class ArticleItem extends StatelessWidget {
  final ArticleBean article;

  ArticleItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return WebViewPage(article.Id ?? "");
          }));

        },
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: FadeInImage.assetNetwork(
                  image: article.images![0],
                  width: 100,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "images/0.PNG",
                      width: 100,
                    );
                  },
                  placeholder: "images/loading.gif",
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${article.title}",
                      style: TextStyle(color: Colors.amber),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Text('${article.desc}'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
