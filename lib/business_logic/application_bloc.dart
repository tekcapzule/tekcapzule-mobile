import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/subjects.dart';
import 'package:tek_capsule/business_logic/event/application_events.dart';
import 'package:tek_capsule/business_logic/model/app_config.dart';
import 'package:tek_capsule/business_logic/model/app_state.dart';
import 'package:tek_capsule/business_logic/model/user_model.dart';

class ApplicationBloc {
  static final ApplicationBloc _instance = ApplicationBloc._internal();

  factory ApplicationBloc() {
    return _instance;
  }

  ApplicationBloc._internal() {
    applicationState = ApplicationState();
    _appEventController.stream.listen(_mapEventToState);
  }

  late ApplicationState applicationState;

  late GlobalKey<ScaffoldMessengerState> globalscaffoldKey;

  final _appEventController = StreamController<ApplicationEvent>();
  Sink<ApplicationEvent> get appEventSink => _appEventController.sink;

  final BehaviorSubject<UserModel> _userData = BehaviorSubject<UserModel>();
  // Streams
  Stream<UserModel> get stateManagementTime => _userData.stream;

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
}
