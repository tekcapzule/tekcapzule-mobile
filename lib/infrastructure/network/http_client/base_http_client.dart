import 'dart:collection';
import 'package:tek_capsule/infrastructure/model/network_typedef_enum.dart';

abstract class BaseHttpClient {
  Map<String, String> getHeaders(ResourceContentType contentType,
      [isBearerRequired = false]) {
    Map<String, String> headers = new HashMap();
    if (ResourceContentType.json == contentType) {
      headers['accept'] = 'application/json';
      headers['content-type'] = 'application/json';
    } else if (ResourceContentType.form == contentType) {
      headers['accept'] = 'application/json';
      headers['content-type'] = 'application/x-www-form-urlencoded';
    } else if (ResourceContentType.webclient == contentType) {
      headers['x-user-login'] = 'linjith.kunnon@gmail.com';
      headers['x-channel-code'] = 'WEB_CLIENT';
      headers['Content-Type'] = 'application/json';
    }
    return headers;
  }

  Uri getUri(String url) => Uri.parse(url);
}
