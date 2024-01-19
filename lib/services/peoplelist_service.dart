import 'package:flutter/foundation.dart';

import '../models/people.dart';
import '../provider/api/peoplelist.dart';
import 'package:http/http.dart' as http;

class PeopleListService {
  final _client = http.Client();
  final _api = PeopleListApi();
  Future<List<People>?> getPeopleList() async {
    List<People>? list = await _api.getPeople(_client);
    if (list != null) {
      return list;
    }
    debugPrint("PeopleListService:Fail to fetch PeopleListApi");
    return null;
  }
}
