import 'package:tek_capsule/business_logic/capsule_bloc.dart';
import 'package:tek_capsule/business_logic/model/user_model.dart';
import 'package:tek_capsule/infrastructure/model/capsule_details.dart';

abstract class ApplicationEvent {  
  double? value;
  ApplicationEvent(this.value);
}

class AppLoadEvent extends ApplicationEvent {
  String langCode;
  AppLoadEvent({required this.langCode, value}) : super(value);
}

class LoginEvent extends ApplicationEvent {
  bool isSuccessful;
  UserModel payload;
  LoginEvent({required this.isSuccessful, required this.payload, value}) : super(value);
}

class LogOutEvent extends ApplicationEvent {
  LogOutEvent(double value) : super(value);
}

class OnRegisterEvent extends ApplicationEvent {
  OnRegisterEvent(double value) : super(value);
}

class OnVerificationEvent extends ApplicationEvent {
  OnVerificationEvent(double value) : super(value);
}

class FirstTimeLoginEvent extends ApplicationEvent {
  FirstTimeLoginEvent(double value) : super(value);
}

class DashBoardLoadEvent extends ApplicationEvent {
  DashBoardLoadEvent(double value) : super(value);
}

class HamburgerOpenEvent extends ApplicationEvent {
  HamburgerOpenEvent(double value) : super(value);
}

class HamburgerCloseEvent extends ApplicationEvent {
  HamburgerCloseEvent(double value) : super(value);
}

class BookmarkEvent extends ApplicationEvent {
  bool isSave;
  CapsuleDetails capsuleDetails;
  CapsuleBloc bloc;
  BookmarkEvent({required this.isSave, required this.bloc, required this.capsuleDetails, value}) : super(value);
}

class PageSwipeEvent extends ApplicationEvent {
  PageSwipeEvent(double value) : super(value);
}