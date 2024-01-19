import 'package:flutter_test/flutter_test.dart';
import 'package:people_in_list_map/utils/constants_api.dart';

void main() {
  group('apiStr', () {
    test('returns correct URL when given a valid path', () {
      const path = 'testPath';
      expect(apiStr(path), equals('https://$mainDomain/$path'));
    });

    test('returns correct URL when given an empty path', () {
      const path = '';
      expect(apiStr(path), equals('https://$mainDomain/'));
    });

    test('returns correct URL when given a path with special characters', () {
      const path = 'testPath/withSpecialCharacters?#';
      expect(apiStr(path), equals('https://$mainDomain/$path'));
    });

    test('returns correct URL when given a path with spaces', () {
      const path = 'test path with spaces';
      expect(apiStr(path), equals('https://$mainDomain/$path'));
    });
  });
}
