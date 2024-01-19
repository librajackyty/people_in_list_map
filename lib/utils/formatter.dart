import 'dart:convert';

import '../models/people.dart';

People peopleFromJson(String str) => People.fromJson(json.decode(str));
String peopleToJson(People data) => json.encode(data.toJson());
