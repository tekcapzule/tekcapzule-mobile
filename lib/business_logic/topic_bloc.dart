import 'dart:convert';

import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/infrastructure/model/topic_details.dart';
import 'package:tek_capsule/infrastructure/service/topic_service/topic_service.dart';

class TopicBloc {
  Stream<List<TopicDetails>> getAllTopics() async* {
    final config = await ApplicationBloc.getAppConfiguration('dev');
    final topicService = TopicService(
        gateway: config.topic!.infra!.gateway!,
        region: config.topic!.infra!.region!,
        stage: config.topic!.infra!.stage!);
    final result = await topicService.getAll();
    List<TopicDetails>? topicList =
        TopicDetails().toListOfTopics(jsonDecode(result.body));
    yield await Future.value(topicList);
  }
}
