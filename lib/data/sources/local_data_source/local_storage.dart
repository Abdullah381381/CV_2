import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {}

class LocalStorageImplementation extends LocalStorage {
  SharedPreferences prefs;
  LocalStorageImplementation({required this.prefs});
}