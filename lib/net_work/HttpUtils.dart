import 'package:dio/dio.dart';

class HttpReqUtils {
  static const TAG = "http_req_util";
  ///请求公共基类
  static const BASE_URL = "";

  static HttpReqUtils instance;
  Dio dio;
  Options options;

  static HttpReqUtils getInstance() {
    if (instance == null) {
      instance = new HttpReqUtils();
    }
    return instance;
  }

  HttpReqUtils() {
    options = new Options(
        // 请求基地址,可以包含子路径
        baseUrl: BASE_URL,
        connectTimeout: 10000,
        receiveTimeout: 3000,
        headers: {});
    dio = new Dio(options);
  }

  /// Get 请求
  get(reqUrl, {paramsData, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(reqUrl, data: paramsData, cancelToken: cancelToken);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print(TAG + 'get请求取消! ' + e.message);
      }
      print(TAG + 'get请求发生错误：$e');
    }
    print(TAG +" response data===>" + response.data.toString());
    return response.data;
  }

  ///Post 请求
  post(reqUrl, {paramsData, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(reqUrl, data: paramsData, cancelToken: cancelToken);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print(TAG + 'post请求取消! ' + e.message);
      }
      print(TAG + 'post请求发生错误：$e');
    }
    print(TAG +" response data===>" +  response.data.toString());
    return response.data;
  }
}
