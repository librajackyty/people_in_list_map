import 'saveData.welltested_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:people_in_list_map/storage/shared_pref.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MySharedPreferences mySharedPreferences;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    mySharedPreferences = MySharedPreferences();
  });

  group('saveData', () {
    test('should return true when data is saved successfully', () async {
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);

      final result = await mySharedPreferences.saveData('key', 'data');

      verify(mockSharedPreferences.setString('key', 'data')).called(1);
      expect(result, true);
    });

    test('should return false when there is an exception', () async {
      when(mockSharedPreferences.setString(any, any))
          .thenThrow(Exception('Test Exception'));

      final result = await mySharedPreferences.saveData('key', 'data');

      verify(mockSharedPreferences.setString('key', 'data')).called(1);
      expect(result, false);
    });
  });
}