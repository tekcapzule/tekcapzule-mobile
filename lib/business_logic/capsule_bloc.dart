import 'dart:async';
import 'dart:convert';
import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/common/model/app-constant.dart';
import 'package:tek_capsule/common/utility/local_store.dart';
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
    ApplicationBloc().checkInternetConnection();
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

  Stream<List<CapsuleDetails>?> getAllCapsules() async* {
    ApplicationBloc().checkInternetConnection();
    final selectedTopic = ApplicationBloc().applicationState.selectedTopic;
    if (selectedTopic != null) {
      final isInternetActive = ApplicationBloc().isInternetActive;
      if (!isInternetActive) {
        final payload =
            await LocalStore().get(key: LocalStoreKeys.SELECTED_TOPIC.name);
        List<CapsuleDetails>? capsuleList =
            CapsuleDetails().toListOfCapsules(json.decode(payload));
        yield await Future.value(capsuleList);
        return;
      }
      final result = await capsuleService.getMyFeed([selectedTopic.code!]);
      List<CapsuleDetails>? capsuleList =
          CapsuleDetails().toListOfCapsules(json.decode(result.body));
      await putValueIntoDB(
          data: result.body, key: LocalStoreKeys.SELECTED_TOPIC.name);
      yield await Future.value(capsuleList);
    } else {
      switch (ApplicationBloc().applicationState.selectedCapsuleType) {
        case CapsuleType.BOOKMARK:
          final isInternetActive = ApplicationBloc().isInternetActive;
          if (!isInternetActive) {
            final payload =
                await LocalStore().get(key: LocalStoreKeys.BOOKMARK.name);
            List<CapsuleDetails>? capsuleList =
                CapsuleDetails().toListOfCapsules(json.decode(payload));
            yield await Future.value(capsuleList);
            return;
          }
          final result = await capsuleService.getTrending();
          List<CapsuleDetails>? capsuleList =
              CapsuleDetails().toListOfCapsules(json.decode(result.body));
          await putValueIntoDB(
              data: result.body, key: LocalStoreKeys.BOOKMARK.name);
          yield await Future.value(capsuleList);
          break;
        case CapsuleType.TRENDING:
          final isInternetActive = ApplicationBloc().isInternetActive;
          if (!isInternetActive) {
            final payload =
                await LocalStore().get(key: LocalStoreKeys.TRENDING.name);
            List<CapsuleDetails>? capsuleList =
                CapsuleDetails().toListOfCapsules(json.decode(payload));
            yield await Future.value(capsuleList);
            return;
          }
          final result = await capsuleService.getTrending();
          List<CapsuleDetails>? capsuleList =
              CapsuleDetails().toListOfCapsules(json.decode(result.body));
          await putValueIntoDB(
              data: result.body, key: LocalStoreKeys.TRENDING.name);
          yield await Future.value(capsuleList);
          break;
        case CapsuleType.NONE:
        default:
          final isInternetActive = ApplicationBloc().isInternetActive;
          if (!isInternetActive) {
            final payload =
                await LocalStore().get(key: LocalStoreKeys.CAPSULE.name);
            List<CapsuleDetails>? capsuleList =
                CapsuleDetails().toListOfCapsules(json.decode(payload));
            yield await Future.value(capsuleList);
            return;
          }
          final result = await capsuleService.getMyFeed(["SWD", "blk"]);
          List<CapsuleDetails>? capsuleList =
              CapsuleDetails().toListOfCapsules(json.decode(result.body));
          await putValueIntoDB(
              data: result.body, key: LocalStoreKeys.CAPSULE.name);
          yield await Future.value(capsuleList);
      }
    }
  }

  Future<void> putValueIntoDB({required String data, key: String}) async {
    final isInternetActive = ApplicationBloc().isInternetActive;
    if (isInternetActive) {
      await LocalStore().put(key: key, value: data);
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
