import 'dart:convert';

/// JSON 节点
///
/// 提供 "null 值安全" + "类型安全" 的 JSON 操作
class StoneJson {
  /// 从一个 [Map<String, dynamic>] 或 [List<dynamic>] 构建 JSON 节点
  StoneJson(this.data);

  /// 从一个 JSON 字符串构建 JSON 节点
  factory StoneJson.decode(String source) {
    try {
      return StoneJson(json.decode(source));
    } catch (_) {
      return StoneJson(null);
    }
  }

  /// 当前节点的数据
  final dynamic data;

  /// 当前节点是否为 [Map<String, dynamic>]
  bool get isMap => data is Map<String, dynamic>;
  /// 当前节点是否为 [List<dynamic>]
  bool get isList => data is List<dynamic>;

  /// 当前界面是否为空，[data] 为 'null、empty、类型错误时' 返回 true
  bool get isEmpty => (mapValue()?.isEmpty ?? listValue()?.isEmpty) ?? true;
  /// 当前界面是否不为空
  bool get isNotEmpty => !isEmpty;

  /// 将当前节点转换为 [List<StoneJson>]
  List<StoneJson> toList() => isList ? data.map<StoneJson>((e) => StoneJson(e)).toList() : <StoneJson>[];

  /// 获取 [int] 值，值不存在默认返回 0，当值为 [double] 或 [String] 类型时进行转换
  int intValue([int defaultValue = 0]) {
    if (data is num) {
      return data.toInt();
    }
    if (data is String) {
      return num.tryParse(data)?.toInt() ?? defaultValue;
    }
    return defaultValue;
  }

  /// 获取 [double] 值，值不存在默认返回 0.0，当值为 [int] 或 [String] 类型时进行转换
  double doubleValue([double defaultValue = 0.0]) {
    if (data is num) {
      return data.toDouble();
    }
    if (data is String) {
      return num.tryParse(data)?.toDouble() ?? defaultValue;
    }
    return defaultValue;
  }

  /// 获取 [bool] 值，值不存在默认返回 false，当值为 [num] 或 [String] 类型时进行转换
  bool boolValue([bool defaultValue = false]) {
    if (data is bool) {
      return data;
    }
    if (data is num) {
      return data != 0;
    }
    if (data is String) {
      final str = data.toLowerCase();
      return str == 'true' || str == 'yes' || str == '1';
    }
    return defaultValue;
  }

  /// 获取 [String] 值，值不存在默认返回 ''，当前值为 [num] 时进行转换
  String stringValue([String defaultValue = '']) {
    if (data is String) {
      return data;
    }
    if (data is num) {
      return data.toString();
    }
    return defaultValue;
  }

  /// 获取 [Map<String, dynamic>] 值，值不存在默认返回 const <String, dynamic>{}
  Map<String, dynamic> mapValue([Map<String, dynamic> defaultValue = const <String, dynamic>{}]) =>
      data is Map<String, dynamic> ? data : defaultValue;

  /// 获取 [List<dynamic>] 值，值不存在默认返回 const <dynamic>[]
  List<dynamic> listValue([List<dynamic> defaultValue = const <dynamic>[]]) =>
      data is List<dynamic> ? data : defaultValue;

  /// 通过下标方式获取值，e.g. stoneJson['toys'][0]['color'].stringValue('No Color')
  StoneJson operator [](Object index) =>
      ((index is int && isList) || (index is String && isMap))
          ? StoneJson(data[index]) : StoneJson(null);
}