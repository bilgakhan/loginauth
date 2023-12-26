import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AuthDb {
  static Box? authBox;

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    authBox = await Hive.openBox('authBox');
  }

  Future<void> writeToDb(String token) async {
    await openBox();
    await authBox!.put('access_token', token);
  }
}
