import 'dart:convert' as convert;

import 'dart:convert';

import 'dart:ui';
class Utils {


  static String base64Decode(String data) {
    List<int> bytes = convert.base64Decode(data);
    String result = convert.utf8.decode(bytes);
    return result;
  }

  static String base64Encode(String data){
    var content = convert.utf8.encode(data);
    var digest = convert.base64Encode(content);
    return digest;
  }

  static String base64UrlDecode(String data) {
    var decode = base64Url.decode(data);
    var result = String.fromCharCodes(decode);
    return result;
  }
}

extension StringExtension1 on String {
  //字符转换成Color对象
  Color? toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  //字符转int
  parseInt() {
    return int.parse(this);
  }
}
