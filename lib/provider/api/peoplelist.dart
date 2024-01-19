import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../models/people.dart';
import '../../utils/constants_api.dart';
import 'package:http/http.dart' as http;

class PeopleListApi {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $peopleListPubKey'
  };

  Future<List<People>?> getPeople(http.Client client) async {
    try {
      debugPrint("PeopleListApi:start getPeople");
      var response = await client.get(Uri.parse(apiStr(peopleList)),
          headers: requestHeaders);
      if (response.statusCode == 200) {
        debugPrint('PeopleListApi::Http Get success: ${response.body}');
        return List<People>.from(
            json.decode(response.body).map((v) => People.fromJson(v)));
      }
      debugPrint('PeopleListApi::Http Get fail: ${response.statusCode}');
      return null;
    } on TimeoutException catch (e) {
      debugPrint('Timeout Error: $e');
      return null;
    } on SocketException catch (e) {
      debugPrint('Socket Error: $e');
      return null;
    } on Error catch (e) {
      debugPrint('General Error: $e');
      return null;
    }
    return null;
  }
}
