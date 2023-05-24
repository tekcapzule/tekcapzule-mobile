import 'dart:convert';

import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/infrastructure/model/topic_details.dart';
import 'package:tek_capsule/infrastructure/service/topic_service/topic_service.dart';

class TopicBloc {
  Future<List<TopicDetails>> getAllTopics() async {
    final config = await ApplicationBloc.getAppConfiguration('dev');
    final topicService = TopicService(
        gateway: config.capsule!.infra!.gateway!,
        region: config.capsule!.infra!.gateway!,
        stage: config.capsule!.infra!.gateway!);
    final result = await topicService.getAll();
    List<TopicDetails>? topicList =
        TopicDetails().toListOfTopics(jsonDecode(result.body));
    return Future.value(topicList);
  }
}
