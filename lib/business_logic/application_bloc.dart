import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:tek_capsule/business_logic/event/application_events.dart';
import 'package:tek_capsule/business_logic/model/user_model.dart';


class ApplicationBloc {

  final _appEventController = StreamController<ApplicationEvent>();
  Sink<ApplicationEvent> get appEventSink => _appEventController.sink;

  ApplicationBloc() {
    _appEventController.stream.listen(_mapEventToState);
  }

  final BehaviorSubject<UserModel> _userData = BehaviorSubject<UserModel>();
  // Streams
  Stream<UserModel> get stateManagementTime => _userData.stream;


  void _mapEventToState(ApplicationEvent event) {
    if (event is LoginEvent) {
      if(event.isSuccessful) {
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
