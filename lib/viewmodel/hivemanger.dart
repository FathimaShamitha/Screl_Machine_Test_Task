import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class HiveFunctions extends ChangeNotifier {
  final userBox = Hive.box('userHiveBox');

  createUser(Map data) {
    userBox.add(data);
    notifyListeners();
  }

  addAllUser(List list) {
    userBox.addAll(list);
    notifyListeners();
  }

  List getAllUsers() {
    final data = userBox.keys.map((key) {
      final value = userBox.get(key);
      return {"key": key, "name": value["name"], "email": value['email']};
    }).toList();

    return data.reversed.toList();
    notifyListeners();
  }

  Map getUser(int id) {
    return userBox.get(id);
    notifyListeners();
  }

  updateUser(int id, Map data) {
    userBox.put(id, data);
    notifyListeners();
  }

  deleteUser(int id) {
    return userBox.delete(id);
    notifyListeners();
  }

  deleteAllUser(int key) {
    return userBox.deleteAll(userBox.keys);
    notifyListeners();
  }
}
