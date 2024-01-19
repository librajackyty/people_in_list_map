import 'dart:convert';

import '../models/person.dart';

Person personFromJsonStr(String str) => Person.fromJson(json.decode(str));
String personToJson(Person data) => json.encode(data.toJson());
