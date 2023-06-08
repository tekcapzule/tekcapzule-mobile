import 'package:flutter/material.dart';
import 'package:tek_capsule/business_logic/application_bloc.dart';
import 'package:tek_capsule/infrastructure/service/auth_service/auth_service.dart';

// ignore: must_be_immutable
class RootInjectorWidget extends InheritedWidget {
  RootInjectorWidget({Key? key, required Widget child})
      : super(key: key, child: child);

  late ApplicationBloc applicationBloc;
  late AuthenticationService authService;

  void init(GlobalKey<ScaffoldMessengerState> scaffoldKey) async {
    applicationBloc = ApplicationBloc();
    applicationBloc.globalscaffoldKey = scaffoldKey;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static RootInjectorWidget? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<RootInjectorWidget>());
  }
}
