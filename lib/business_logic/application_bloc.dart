import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/subjects.dart';
import 'package:tek_capsule/business_logic/event/application_events.dart';
import 'package:tek_capsule/business_logic/model/app_config.dart';
import 'package:tek_capsule/business_logic/model/app_state.dart';
import 'package:tek_capsule/business_logic/model/user_model.dart';
import 'package:tek_capsule/common/model/app-constant.dart';

class ApplicationBloc {
  static final ApplicationBloc _instance = ApplicationBloc._internal();
  late ApplicationState applicationState;
  late GlobalKey<ScaffoldMessengerState> globalscaffoldKey;
  late StreamController<ApplicationEvent> _appEventController;
  late BehaviorSubject<UserModel> _userData;
  bool isInternetActive = false;

  Sink<ApplicationEvent> get appEventSink => _appEventController.sink;

  // Streams
  Stream<UserModel> get stateManagementTime => _userData.stream;

  factory ApplicationBloc() {
    return _instance;
  }

  ApplicationBloc._internal() {
    applicationState = ApplicationState();
    applicationState.selectedCapsuleType = CapsuleType.NONE;
    _appEventController = StreamController<ApplicationEvent>();
    _userData = BehaviorSubject<UserModel>();
    _appEventController.stream.listen(_mapEventToState);    
    checkInternetConnection();
  }

  static Future<AppConfig> getAppConfiguration(String? env) async {
    env = env ?? 'dev';
    final contents = await rootBundle.loadString(
      'assets/config/$env.json',
    );
    final json = jsonDecode(contents);
    return AppConfig.fromJson(json);
  }

  void _mapEventToState(ApplicationEvent event) {
    if (event is LoginEvent) {
      if (event.isSuccessful) {
        onSuccessfulLogin(event.payload);
      } else {
        onFailureLogin(event.payload);
      }
    }

    if (event is BookmarkEvent) {
      if (event.isSave) event.bloc.setBookmark(event.capsuleDetails);
    }
  }

  onSuccessfulLogin(value) async {
    _userData.sink.add(value);
  }

  onFailureLogin(value) async {
    _userData.sink.add(value);
  }

  dispose() {
    _userData.close();
    _appEventController.close();
  }

  checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isInternetActive = true;
      }
    } on SocketException catch (_) {
      isInternetActive = false;
    }
  }
}
