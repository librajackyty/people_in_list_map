import 'dart:convert';

import '../models/people.dart';

People peopleFromJsonStr(String str) => People.fromJson(json.decode(str));
String peopleToJson(People data) => json.encode(data.toJson());
