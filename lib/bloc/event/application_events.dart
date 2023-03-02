import 'package:tek_capsule/bloc/model/user_model.dart';

abstract class ApplicationEvent {  
  double value;
  ApplicationEvent(this.value);
}

class LoginEvent extends ApplicationEvent {
  bool isSuccessful;
  UserModel payload;
  LoginEvent({required this.isSuccessful, required this.payload, value}) : super(value);
}
