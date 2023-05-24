import 'dart:convert';
import 'package:http/http.dart';
import 'package:tek_capsule/infrastructure/model/network_typedef_enum.dart';
import 'package:tek_capsule/infrastructure/network/worker_http_client.dart';

class TopicService {
  late WorkerHttpClient httpClient;
  String gateway; //ydfobf5vfd.execute-api
  String region; //us-east-1
  String stage; //dev

  TopicService(
      {required this.gateway, required this.region, required this.stage}) {
    httpClient = WorkerHttpClient();
  }

  Future<Response> getAll() async {
    final payload = json.encode({});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/topic/getAll'),
        ResourceContentType.webclient,
        payload,
        false);
  }
}
