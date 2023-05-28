import 'dart:convert';

import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/infrastructure/model/capsule_details.dart';
import 'package:tek_capsule/infrastructure/service/capsule_service/capsule_service.dart';

class CapsuleBloc {
  Future<List<CapsuleDetails>> getAllCapsules() async {
    final config = await ApplicationBloc.getAppConfiguration('dev');
    final capsuleService = CapsuleService(
        gateway: config.capsule!.infra!.gateway!,
        region: config.capsule!.infra!.region!,
        stage: config.capsule!.infra!.stage!);
    final result = await capsuleService.getMyFeed(["SWD", "blk"]);
    List<CapsuleDetails>? capsuleList =
        CapsuleDetails().toListOfCapsules(json.decode(result.body));
    return Future.value(capsuleList);
  }
}