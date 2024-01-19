import 'package:welltested_annotation/welltested_annotation.dart';

const String mainDomain = "api.json-generator.com";
const String personList = "templates/-xdNcNKYtTFG/data";
const String personListPubKey = "b2atclr0nk1po45amg305meheqf4xrjt9a1bo410";

@Welltested()
String apiStr(String path) {
  return "https://$mainDomain/$path";
}
