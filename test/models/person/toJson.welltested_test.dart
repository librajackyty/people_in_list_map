import 'package:flutter_test/flutter_test.dart';
import 'package:people_in_list_map/models/person.dart';

void main() {
  group('Person', () {
    test('toJson returns correct json map representation', () {
      final person = Person(
        id: '1',
        name: Name(first: 'John', last: 'Doe'),
        email: 'john.doe@example.com',
        picture: 'picture.jpg',
        location: Location(latitude: 12.34, longitude: 56.78),
      );

      expect(
        person.toJson(),
        {
          '_id': '1',
          'name': {'first': 'John', 'last': 'Doe'},
          'email': 'john.doe@example.com',
          'picture': 'picture.jpg',
          'location': {'latitude': 12.34, 'longitude': 56.78},
        },
      );
    });
  });
}