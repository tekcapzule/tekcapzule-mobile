import 'dart:async';
import 'dart:convert';
import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/common/model/app-constant.dart';
import 'package:tek_capsule/infrastructure/model/bookmark_response.dart';
import 'package:tek_capsule/infrastructure/model/capsule_details.dart';
import 'package:tek_capsule/infrastructure/service/capsule_service/capsule_service.dart';

class CapsuleBloc {
  late CapsuleService capsuleService;
  late StreamController<bool> capsuleControl;
  late bool bookmarkCapsule;

  set setCapsuleBookmark(bool val) => bookmarkCapsule = val;

  Stream<bool> get getCapsuleBookmark => capsuleControl.stream;

  CapsuleBloc() {
    initService();
    initSubscribers();
  }

  initSubscribers() {
    capsuleControl = StreamController<bool>();
  }

  initService() async {
    final config = await ApplicationBloc.getAppConfiguration('dev');
    capsuleService = CapsuleService(
        gateway: config.capsule!.infra!.gateway!,
        region: config.capsule!.infra!.region!,
        stage: config.capsule!.infra!.stage!);
  }

  Stream<List<CapsuleDetails>> getAllCapsules() async* {
    final selectedTopic = ApplicationBloc().applicationState.selectedTopic;
    if (selectedTopic != null) {
      final result = await capsuleService.getMyFeed([selectedTopic.code!]);
      List<CapsuleDetails>? capsuleList =
          CapsuleDetails().toListOfCapsules(json.decode(result.body));
      yield await Future.value(capsuleList);
    } else {
      switch (ApplicationBloc().applicationState.selectedCapsuleType) {
        case CapsuleType.BOOKMARK:
          final result = await capsuleService.getTrending();
          List<CapsuleDetails>? capsuleList =
              CapsuleDetails().toListOfCapsules(json.decode(result.body));
          yield await Future.value(capsuleList);
          break;
        case CapsuleType.TRENDING:
          final result = await capsuleService.getTrending();
          List<CapsuleDetails>? capsuleList =
              CapsuleDetails().toListOfCapsules(json.decode(result.body));
          yield await Future.value(capsuleList);
          break;
        case CapsuleType.NONE:
        default:
          final result = await capsuleService.getMyFeed(["SWD", "blk"]);
          List<CapsuleDetails>? capsuleList =
              CapsuleDetails().toListOfCapsules(json.decode(result.body));
          yield await Future.value(capsuleList);
      }
    }
  }

  void setBookmark(CapsuleDetails? capsuleData) async {
    final result = await capsuleService.setBookmark(capsuleData?.capsuleId);
    BookmarkResponse bookmarkResponse =
        BookmarkResponse.fromJson(json.decode(result.body));
    capsuleControl.sink.add(true);
  }

  void dispose() {
    capsuleControl.close();
  }
}
