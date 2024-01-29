import 'package:dart_mappable/dart_mappable.dart';

class IntHook extends MappingHook {
  const IntHook();

  @override
  int? beforeDecode(Object? value) {
    return value != null ? (value as num).toInt() : null;
  }
}
