import 'dart:convert';
import 'package:http/http.dart';
import 'package:tek_capsule/infrastructure/model/capsule_details.dart';
import 'package:tek_capsule/infrastructure/model/network_typedef_enum.dart';
import 'package:tek_capsule/infrastructure/network/worker_http_client.dart';


class CapsuleService {
  late WorkerHttpClient httpClient;
  String gateway; //0isr8e2ete.execute-api
  String region; //us-west-2
  String stage; //dev

  CapsuleService(
      {required this.gateway, required this.region, required this.stage}) {
    httpClient = WorkerHttpClient();
  }

  Future<Response> getCapsuleById(String capsuleId) async {
    final payload = json.encode({"capsuleId": capsuleId});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/get'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> createCapsule(CapsuleDetails data) async {
    final payload = json.encode(data);
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/create'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> updateCapsule(CapsuleDetails data) async {
    final payload = json.encode(data);
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/update'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> setRecommendations(String capsuleId) async {
    final payload = json.encode({"capsuleId": capsuleId});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/recommend'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> getEditorPick(String capsuleId) async {
    final payload = json.encode({});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/getEditorsPick'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> getMyFeed(List<String> topicCollection) async {
    final payload = json.encode({"subscribedTopics": topicCollection});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/getMyFeed'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> getMetadata(String emailId) async {
    final payload = '''$emailId\n''';
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/getMetadata'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> getPendingApproval() async {
    final payload = json.encode({});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/getPendingApproval'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> setBookmark(String capsuleId) async {
    final payload = json.encode({"capsuleId": capsuleId});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/bookmark'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> getTrending() async {
    final payload = json.encode({});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/getTrending'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> disableCapsule(String capsule) async {
    final payload = json.encode({"capsuleId": capsule});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/disable'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> searchByTopic(String topic) async {
    final payload = json.encode({"subscribedTopic": topic});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/searchByTopic'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> approveCapsule(String capsuleId) async {
    final payload = json.encode({"capsuleId": capsuleId});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/capsule/approve'),
        ResourceContentType.webclient,
        payload,
        false);
  }
}
