import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

import '../model/usermodel.dart';

class UserViewModel extends ChangeNotifier {
  static const String userBoxName = 'userBox';

  List<User> _user = [];

  List<User> get user => _user;

  UserViewModel() {
    fetchData();
  }

  Future<void> fetchData() async {
    var box = await Hive.openBox<User>(userBoxName);
    _user = box.values.toList();
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    var box = await Hive.openBox<User>(userBoxName);
    await box.put(user.id, user);
    await fetchData();
    notifyListeners();
  }

  Future<void> deleteUser(User user) async {
    var box = await Hive.openBox<User>(userBoxName);
    if (box.containsKey(user.id)) {
      box.delete(user.id);
      Fluttertoast.showToast(msg: '${user.name} deleted');
    } else {
      Fluttertoast.showToast(msg: 'User not found');
    }

    notifyListeners();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
