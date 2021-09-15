/// data : [{"image":"http://gank.io/images/cfb4028bfead41e8b6e34057364969d1","title":"干货集中营新版更新","url":"https://gank.io/migrate_progress"},{"image":"http://gank.io/images/aebca647b3054757afd0e54d83e0628e","title":"- 春水初生，春林初盛，春风十里，不如你。","url":"https://gank.io/post/5e51497b6e7524f833c3f7a8"},{"image":"https://pic.downk.cc/item/5e7b64fd504f4bcb040fae8f.jpg","title":"盘点国内那些免费好用的图床","url":"https://gank.io/post/5e7b5a8b6d2e518fdeab27aa"}]
/// status : 100

class BannerResult {
  final List<BannerBean>? data;
  final int? status;

  BannerResult(this.data, this.status);

  static BannerResult fromMap(Map<String, dynamic> map) {
    BannerResult bannerBean = BannerResult(
     map['data']!=null ? ([]..addAll(
       (map['data'] as List).map((o) => BannerBean.fromMap(o))
     )) : null,
     map['status'],
    );
    return bannerBean;
  }

  Map toJson() => {
    "data": data?.map((o)=>o.toJson()).toList(growable: false),
    "status": status,
  }..removeWhere((k,v)=>v==null);

  @override
  String toString() {
    return 'BannerResult{data: $data, status: $status}';
  }
}

/// image : "http://gank.io/images/cfb4028bfead41e8b6e34057364969d1"
/// title : "干货集中营新版更新"
/// url : "https://gank.io/migrate_progress"

class BannerBean {
  final String? image;
  final String? title;
  final String? url;

  BannerBean(this.image, this.title, this.url);

  static BannerBean fromMap(Map<String, dynamic> map) {
    BannerBean dataBean = BannerBean(
     map['image'],
     map['title'],
     map['url'],
    );
    return dataBean;
  }

  Map toJson() => {
    "image": image,
    "title": title,
    "url": url,
  }..removeWhere((k,v)=>v==null);

  @override
  String toString() {
    return 'BannerBean{image: $image, title: $title, url: $url}';
  }
}