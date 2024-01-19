import 'clearData.welltested_test.mocks.dart';
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

  test('clearData with valid key', () async {
    when(mockSharedPreferences.remove(any)).thenAnswer((_) async => true);
    when(SharedPreferences.getInstance()).thenAnswer((_) async => mockSharedPreferences);

    await mySharedPreferences.clearData('testKey');

    verify(mockSharedPreferences.remove('testKey')).called(1);
  });

  test('clearData with invalid key', () async {
    when(mockSharedPreferences.remove(any)).thenAnswer((_) async => false);
    when(SharedPreferences.getInstance()).thenAnswer((_) async => mockSharedPreferences);

    await mySharedPreferences.clearData('invalidKey');

    verify(mockSharedPreferences.remove('invalidKey')).called(1);
  });

  test('clearData with exception', () async {
    when(mockSharedPreferences.remove(any)).thenThrow(Exception('Test Exception'));
    when(SharedPreferences.getInstance()).thenAnswer((_) async => mockSharedPreferences);

    await mySharedPreferences.clearData('testKey');

    verify(mockSharedPreferences.remove('testKey')).called(1);
  });
}