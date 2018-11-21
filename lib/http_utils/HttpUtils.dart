//import 'dart:async';
//import 'dart:convert';
//
////导入网络请求相关的包
//import 'package:http/htztp.dart' as http;
//
//class HttpUtils {
//  HttpUtils(this.url, [this.parames]);
//
//  var url;
//  Map<String, String> parames;
//  var list;
//  Future<dynamic> get() async {
//    print('url$url');
//    await http.get(url).then((http.Response response) {
//      var data = json.decode(response.body);
//      list = data["data"]["datas"];
//      print('list$list');
//    });
//    return list;
//  }
//
//  Future<dynamic> post() async {
//    await http.post(url).then((http.Response respose) {
//      var hh = respose.body;
//      print('respose($hh)');
//      var data = json.decode(respose.body);
//
//      list =data["data"]["datas"];
//      print('list$list');
//    });
//    return list;
//  }
//}
