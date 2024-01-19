import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welltested_annotation/welltested_annotation.dart';

@Welltested()
class MySharedPreferences {
  // Function to save data with an expiration date to SharedPreferences
  Future<bool> saveData(String key, String data) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, data);
      debugPrint('Data saved to SharedPreferences.');
      return true;
    } catch (e) {
      debugPrint('Error saving data to SharedPreferences: $e');
      return false;
    }
  }

  // Function to get data from SharedPreferences if it's not expired
  Future<String?> getData(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? data = prefs.getString(key);
      if (data == null) {
        debugPrint('No data found in SharedPreferences.');
        return null; // No data found.
      }

      return data;
    } catch (e) {
      debugPrint('Error retrieving data from SharedPreferences: $e');
      return null;
    }
  }

  // Function to clear data from SharedPreferences
  Future<void> clearData(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
      debugPrint('Data cleared from SharedPreferences.');
    } catch (e) {
      debugPrint('Error clearing data from SharedPreferences: $e');
    }
  }
}
