import 'package:welltested_annotation/welltested_annotation.dart';

import 'person.dart';

@Welltested()
class ScreenArg {
  final Person person;
  final int? index;

  ScreenArg(this.person, {this.index});
}
