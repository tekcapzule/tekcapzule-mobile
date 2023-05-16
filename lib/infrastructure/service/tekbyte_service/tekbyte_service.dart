import 'dart:convert';
import 'package:http/http.dart';
import 'package:tek_capsule/infrastructure/model/network_typedef_enum.dart';
import 'package:tek_capsule/infrastructure/network/worker_http_client.dart';



class TekByteService {
  late WorkerHttpClient httpClient;
  String gateway; //ddrp8i0mtd.execute-api
  String region; //us-west-2
  String stage; //dev

  TekByteService(
      {required this.gateway, required this.region, required this.stage}) {
    httpClient = WorkerHttpClient();
  }

  Future<Response> getAll() async {
    final payload = json.encode({});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/tekbyte/getAll'),
        ResourceContentType.webclient,
        payload,
        false);
  }

  Future<Response> get(String code) async {
    final payload = json.encode({"code": code});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/tekbyte/get'),
        ResourceContentType.webclient,
        payload,
        false);
  }

    Future<Response> disable(String code) async {
    final payload = json.encode({"code": code});
    return httpClient.post(
        httpClient.getUri(
            'https://$gateway.$region.amazonaws.com/$stage/tekbyte/disable'),
        ResourceContentType.webclient,
        payload,
        false);
  }

}
