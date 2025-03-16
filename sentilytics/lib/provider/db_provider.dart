import 'package:flutter/material.dart';
import 'package:sentilytics/service/database_service.dart';

class DbProvider extends ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();
  var userName = 'User...';
  bool isPremiumUser = false;

  getName(String uid, BuildContext context) async {
    var name = await _dbService.getName(uid, context);
    if (name == null) {
      userName = 'null';
    } else {
      userName = name;
    }
    notifyListeners();
  }

  upgradeUserToPremium(String uid, BuildContext context) async {
    await _dbService.upgradeUserToPremium(uid, context);
    notifyListeners();
  }

  Future<bool> checkUserStatus(String uid, BuildContext context) async {
    bool data = await _dbService.checkUserStatus(uid, context);
    return data;
  }
}
