import 'dart:collection';

import '../../model/network_typedef_enum.dart';


abstract class BaseHttpClient {
  Map<String, String> getHeaders(ContentType contentType, [isBearerRequired=false]) {
    Map<String, String> headers = new HashMap();
    if (ContentType.json == contentType) {
      headers['accept'] = 'application/json';
      headers['content-type'] = 'application/json';
    } else if (ContentType.form == contentType) {
      headers['accept'] = 'application/json';
      headers['content-type'] = 'application/x-www-form-urlencoded';
    }
    return headers;
  }
}
