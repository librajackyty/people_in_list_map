import 'personFromJsonStr.welltested_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:people_in_list_map/models/person.dart';
import 'dart:convert';
import 'package:people_in_list_map/utils/formatter.dart';

@GenerateMocks([Person, Name, Location])
void main() {
  group('PersonFromJsonStr', () {
    test('should return a valid model when the JSON string is correct', () {
      final mockPerson = MockPerson();
      final jsonString = json.encode(mockPerson.toJson());

      final result = personFromJsonStr(jsonString);

      expect(result, isA<Person>());
    });

    test('should throw an exception when the JSON string is incorrect', () {
      final jsonString = 'invalid json string';

      expect(() => personFromJsonStr(jsonString), throwsA(isA<FormatException>()));
    });

    test('should throw an exception when the JSON string is null', () {
      final jsonString = null;

      expect(() => personFromJsonStr(jsonString), throwsA(isA<FormatException>()));
    });

    test('should throw an exception when the JSON string is empty', () {
      final jsonString = '';

      expect(() => personFromJsonStr(jsonString), throwsA(isA<FormatException>()));
    });
  });
}