import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/people.dart';
import '../provider/api/peoplelist.dart';
import 'package:http/http.dart' as http;

import '../storage/shared_pref.dart';
import '../utils/constants.dart';

class PeopleListService {
  final MySharedPreferences _mySharedPreferences = MySharedPreferences();
  final _client = http.Client();
  final _api = PeopleListApi();

  Future<List<People>?> getPeopleList() async {
    debugPrint("PeopleListService:start getPeopleList");
    List<People>? list = await _api.getPeople(_client);
    if (list != null) {
      final isSaved = await _mySharedPreferences.saveData(
          storeKeyPeopleList, jsonEncode(list.map((v) => v.toJson()).toList()));
      if (isSaved) {
        return list;
      } else {
        throw Exception(
            'PeopleListService::getPeopleList:: Failed to save data');
      }
    } else {
      debugPrint("PeopleListService:Fail to fetch PeopleListApi");
      debugPrint("PeopleListService:Try to get data from storage");
      final String? jsonData =
          await _mySharedPreferences.getData(storeKeyPeopleList);
      if (jsonData != null) {
        return List<People>.from(
            json.decode(jsonData).map((v) => People.fromJson(v)));
      }
      debugPrint(
          "PeopleListService:No data(key:$storeKeyPeopleList) from storage return null");
      return null;
    }
  }
}
