import 'dart:convert';

import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/common/model/app-constant.dart';
import 'package:tek_capsule/common/utility/local_store.dart';
import 'package:tek_capsule/infrastructure/model/topic_details.dart';
import 'package:tek_capsule/infrastructure/service/topic_service/topic_service.dart';

class TopicBloc {
  TopicBloc() {
    ApplicationBloc().checkInternetConnection();
  }

  Stream<List<TopicDetails>?> getAllTopics() async* {
    ApplicationBloc().checkInternetConnection();
    final isInternetActive = ApplicationBloc().isInternetActive;
    if (!isInternetActive) {
      final payload = await LocalStore().get(key: LocalStoreKeys.TOPICS.name);
      List<TopicDetails>? topicList =
          TopicDetails().toListOfTopics(jsonDecode(payload));
      yield await Future.value(topicList);
      return;
    }
    final config = await ApplicationBloc.getAppConfiguration('dev');
    final topicService = TopicService(
        gateway: config.topic!.infra!.gateway!,
        region: config.topic!.infra!.region!,
        stage: config.topic!.infra!.stage!);
    final result = await topicService.getAll();
    List<TopicDetails>? topicList =
        TopicDetails().toListOfTopics(jsonDecode(result.body));
    if (isInternetActive) {
      await LocalStore()
          .put(key: LocalStoreKeys.TOPICS.name, value: result.body);
    }
    yield await Future.value(topicList);
  }
}
