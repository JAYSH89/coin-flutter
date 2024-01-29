import 'package:dart_mappable/dart_mappable.dart';

class DateTimeHook extends MappingHook {
  const DateTimeHook();

  @override
  dynamic beforeDecode(dynamic value) {
    return value != null ? DateTime.parse(value) : null;
  }
}
