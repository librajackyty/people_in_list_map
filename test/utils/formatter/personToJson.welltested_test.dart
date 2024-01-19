import 'personToJson.welltested_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:people_in_list_map/models/person.dart';
import 'package:people_in_list_map/utils/formatter.dart';

@GenerateMocks([Person, Name, Location])
void main() {
  group('personToJson', () {
    test('returns correct json string', () {
      final mockName = MockName();
      when(mockName.toJson()).thenReturn({
        'last': 'Doe',
        'first': 'John',
      });

      final mockLocation = MockLocation();
      when(mockLocation.toJson()).thenReturn({
        'latitude': 12.34,
        'longitude': 56.78,
      });

      final mockPerson = MockPerson();
      when(mockPerson.toJson()).thenReturn({
        '_id': '123',
        'name': mockName.toJson(),
        'email': 'johndoe@example.com',
        'picture': 'picture.jpg',
        'location': mockLocation.toJson(),
      });

      final jsonString = personToJson(mockPerson);
      expect(jsonString, '{"_id":"123","name":{"last":"Doe","first":"John"},"email":"johndoe@example.com","picture":"picture.jpg","location":{"latitude":12.34,"longitude":56.78}}');
    });
  });
}