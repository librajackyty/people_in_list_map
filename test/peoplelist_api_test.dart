import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:people_in_list_map/models/people.dart';
import 'package:people_in_list_map/provider/api/peoplelist.dart';

void main() {
  group('peoplelist', () {
    test('returns people list when http response is successful (Status 200)',
        () async {
      // Mock the API call to return a json response with http status 200 Ok //
      final mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        final response = [
          {
            "_id": "6b3364c8-df2b-47ba-8b69-7e76c14b704d",
            "name": {"last": "Huff", "first": "Charity"},
            "email": "carlene.ingram@sarasonic.dnp",
            "picture": "https://placebear.com/123/165",
            "location": {"latitude": 22.31, "longitude": null}
          }
        ];
        return Response(jsonEncode(response), 200);
      });
      // Check whether getNumberTrivia function returns
      // number trivia which will be a String
      expect(
          await PeopleListApi().getPeople(mockHTTPClient), isA<List<People>>());
    });

    test('return null when http response is unsuccessful (Status not 200)',
        () async {
      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });
      expect(await PeopleListApi().getPeople(mockHTTPClient), isNull);
    });
  });
}
