import 'getData.welltested_test.mocks.dart';
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

  test('getData returns valid data', () async {
    const testKey = 'testKey';
    const testData = 'testData';

    when(mockSharedPreferences.getString(testKey)).thenReturn(testData);
    when(SharedPreferences.getInstance()).thenAnswer((_) async => mockSharedPreferences);

    final result = await mySharedPreferences.getData(testKey);

    expect(result, testData);
    verify(mockSharedPreferences.getString(testKey)).called(1);
  });

  test('getData returns null when no data found', () async {
    const testKey = 'testKey';

    when(mockSharedPreferences.getString(testKey)).thenReturn(null);
    when(SharedPreferences.getInstance()).thenAnswer((_) async => mockSharedPreferences);

    final result = await mySharedPreferences.getData(testKey);

    expect(result, null);
    verify(mockSharedPreferences.getString(testKey)).called(1);
  });

  test('getData returns null when exception occurs', () async {
    const testKey = 'testKey';

    when(mockSharedPreferences.getString(testKey)).thenThrow(Exception('Test Exception'));
    when(SharedPreferences.getInstance()).thenAnswer((_) async => mockSharedPreferences);

    final result = await mySharedPreferences.getData(testKey);

    expect(result, null);
    verify(mockSharedPreferences.getString(testKey)).called(1);
  });
}