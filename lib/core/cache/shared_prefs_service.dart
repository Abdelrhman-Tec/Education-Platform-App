import 'package:shared_preferences/shared_preferences.dart';

/// A service class to handle Shared Preferences operations.
/// Provides methods for saving, retrieving, and removing data in a type-safe way.
class SharedPrefsService {
  static SharedPreferences? _prefs;

  /// Initialize Shared Preferences instance — must be called before using the service.
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save a string value
  static Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  /// Save an integer value
  static Future<void> saveInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  /// Save a boolean value
  static Future<void> saveBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  /// Save a double value
  static Future<void> saveDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  /// Retrieve a string value
  static String? getString(String key) => _prefs?.getString(key);

  /// Retrieve an integer value
  static int? getInt(String key) => _prefs?.getInt(key);

  /// Retrieve a boolean value
  static bool? getBool(String key) => _prefs?.getBool(key);

  /// Retrieve a double value
  static double? getDouble(String key) => _prefs?.getDouble(key);

  /// Remove a specific key
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  /// Clear all stored data
  static Future<void> clear() async {
    await _prefs?.clear();
  }

  /// Check if a key exists
  static bool containsKey(String key) => _prefs?.containsKey(key) ?? false;
}
