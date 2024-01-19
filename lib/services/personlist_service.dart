import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/person.dart';
import '../provider/api/personlist.dart';
import 'package:http/http.dart' as http;

import '../storage/shared_pref.dart';
import '../utils/constants.dart';

class PersonListService {
  final MySharedPreferences _mySharedPreferences = MySharedPreferences();
  final _client = http.Client();
  final _api = PersonListApi();

  Future<List<Person>?> getPersonList() async {
    debugPrint("PersonListService:start getPersonList");
    List<Person>? list = await _api.getPerson(_client);
    if (list != null) {
      final isSaved = await _mySharedPreferences.saveData(
          storeKeyPersonList, jsonEncode(list.map((v) => v.toJson()).toList()));
      if (isSaved) {
        return list;
      } else {
        throw Exception(
            'PersonListService::getPersonList:: Failed to save data');
      }
    } else {
      debugPrint("PersonListService:Fail to fetch PersonListApi");
      debugPrint("PersonListService:Try to get data from storage");
      final String? jsonData =
          await _mySharedPreferences.getData(storeKeyPersonList);
      if (jsonData != null) {
        return List<Person>.from(
            json.decode(jsonData).map((v) => Person.fromJson(v)));
      }
      debugPrint(
          "PersonListService:No data(key:$storeKeyPersonList) from storage return null");
      return null;
    }
  }
}
