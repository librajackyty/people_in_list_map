import 'dart:convert';

import 'package:welltested_annotation/welltested_annotation.dart';

import '../models/person.dart';

@Welltested()
Person personFromJsonStr(String str) => Person.fromJson(json.decode(str));

@Welltested()
String personToJson(Person data) => json.encode(data.toJson());
