import 'package:hive_flutter/hive_flutter.dart';
import 'package:tek_capsule/common/model/app-constant.dart';

class LocalStore {
  var hiveBox;

  static final LocalStore _instance = LocalStore._internal();

  LocalStore._internal();

  factory LocalStore() {
    return _instance;
  }

  init() async {
    // final dirObj = await getApplicationDocumentsDirectory();
    await Hive.initFlutter();
    hiveBox = await Hive.openBox<String>('config');
  }

  get({key: String}) async {
    return hiveBox.get(key);
  }

  put({key: String, value}) async {
    return hiveBox.put(key, value);
  }

  delete({key: String}) async {
    await hiveBox.delete(key);
  }

  deleteAll() async {
    await hiveBox.deleteAll(LocalStoreKeys.values.map((e) => e.name).toList());
  }

  dispose() {
    try {
      Hive.close();
    } on Exception catch (e) {
      print('An error occurred while disposing local store: $e');
    }
  }
}
