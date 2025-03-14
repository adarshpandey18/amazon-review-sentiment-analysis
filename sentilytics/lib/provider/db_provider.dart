import 'package:flutter/material.dart';
import 'package:sentilytics/service/database_service.dart';

class DbProvider extends ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();
  var userName = 'User...';
  getName(String uid, BuildContext context) async {
    var name = await _dbService.getName(uid, context);
    if (name == null) {
      userName = 'null';
    } else {
      userName = name;
    }
    notifyListeners();
  }
}
