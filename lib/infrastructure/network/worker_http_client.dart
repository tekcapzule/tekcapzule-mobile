import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tek_capsule/infrastructure/model/network_typedef_enum.dart';
import 'package:tek_capsule/infrastructure/network/http_client/base_http_client.dart';


class WorkerHttpClient extends BaseHttpClient {

  WorkerHttpClient() : super();

  Future<Response> get(
      Uri url, ResourceContentType contentType, bool isBearerRequired) async {
    var responseJson;
    try {
      final response = await http.get(url,
          headers: getHeaders(contentType, isBearerRequired));
      responseJson = _returnResponse(response);
    } on TimeoutException {
      throw TimeoutException('Request timeout');
    } on SocketException {
      throw SocketException('No Internet connection');
    }
    return responseJson;
  }

  Future<Response> post(dynamic url, ResourceContentType contentType, dynamic payload,
      bool isBearerRequired) async {
    var responseJson;
    try {
      final response = await http.post(url,
          headers: getHeaders(contentType, isBearerRequired),
          body: payload,
          encoding: Encoding.getByName('utf-8'));
      responseJson = _returnResponse(response);
    } on TimeoutException {
      throw TimeoutException('Request timeout');
    } on SocketException {
      throw SocketException('No Internet connection');
    }
    return responseJson;
  }

  Future<Response> put(dynamic url, dynamic payload) async {
    var responseJson;
    try {
      final response = await http.put(url, body: payload);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw SocketException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<Response> delete(
      dynamic url, ResourceContentType contentType, isBearerRequired) async {
    var apiResponse;
    try {
      print('Api delete, url $url');
      final response = await http.delete(url,
          headers: getHeaders(contentType, isBearerRequired));
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw SocketException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }

  Future<Response> patch(dynamic url, dynamic payload) async {
    var responseJson;
    try {
      final response = await http.patch(url, body: payload);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw SocketException('No Internet connection');
    }
    print('api patch.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<Response> head(dynamic url) async {
    var apiResponse;
    try {
      print('Api delete, url $url');
      final response = await http.head(url);
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw SocketException('No Internet connection');
    }
    print('api head.');
    return apiResponse;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 204:
        return response;
      case 400:
        throw Exception(response.body.toString());
      case 401:
      case 403:
        throw Exception(response.body.toString());
      case 500:
      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}
