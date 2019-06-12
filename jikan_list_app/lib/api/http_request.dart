import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jikan_list_app/util/enum.dart';

/// HttpMethod:
/// リクエストのメソッドを定義
/// Enum は Swift っぽくかける Util を使用
class HttpMethod extends Enum<String> {
  const HttpMethod(String val): super(val);

  static const HttpMethod GET = const HttpMethod('GET');
  static const HttpMethod POST = const HttpMethod('POST');
  static const HttpMethod PUT = const HttpMethod('PUT');
  static const HttpMethod DELETE = const HttpMethod('DELETE');
}

/// ContentEncoding:
/// リクエストのエンコード
enum ContentEncoding { url, json }

/// HttpRequestProtocol: 
/// HTTP リクエストに必要な情報をここに定義する
abstract class HttpRequestProtocol {
  String get baseUrl;
  String get path;
  HttpMethod get method;
  Map<String, String> get headers;
  Map<String, dynamic> get parameters;
  ContentEncoding get contentEncoding;

  /// このメソッドはオーバーライドしない
  /// メソッドが GET の時は常にパラメーターをクエリとして追加する
  String get queryParameters {
    if (method == HttpMethod.GET) {
      final jsonString = Uri(queryParameters: parameters);
      return '?${jsonString.query}';
    }
    return '';
  }
}

/// HttpRequest:
/// Dart の基本の Request クラスを HttpRequestProtocol で拡張したもの
class HttpRequest extends Request {
  final HttpRequestProtocol service;

  HttpRequest(this.service)
    : super(
        service.method.value,
        Uri.parse('${service.baseUrl}${service.path}${service.queryParameters}')
    );
  
  @override
  Map<String, String> get headers => this.service.headers;

  @override
  String get body => json.encode(this.service.parameters);

  @override
  Uint8List get bodyBytes {
    if (service.contentEncoding == ContentEncoding.url) {
      final queryParameters = Uri(queryParameters: service.parameters);
      List<int> bodyBytes = utf8.encode(queryParameters.query);

      return bodyBytes;
    } else {
      final encodedBody = Utf8Codec().encode(body);
      return Uint8List.fromList(encodedBody);
    }
  }

  @override
  MediaType get _contentType {
    var contentType = headers['content-type'];
    if (contentType == null) return null;
    return new MediaType.parse(contentType);
  }
}