import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../models/person.dart';
import '../../utils/constants_api.dart';
import 'package:http/http.dart' as http;

class PersonListApi {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $personListPubKey'
  };

  Future<List<Person>?> getPerson(http.Client client) async {
    try {
      debugPrint("PersonListApi:start getPerson");
      var response = await client.get(Uri.parse(apiStr(personList)),
          headers: requestHeaders);
      if (response.statusCode == 200) {
        debugPrint('PersonListApi::Http Get success: ${response.body}');
        return List<Person>.from(
            json.decode(response.body).map((v) => Person.fromJson(v)));
      }
      debugPrint('PersonListApi::Http Get fail: ${response.statusCode}');
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
