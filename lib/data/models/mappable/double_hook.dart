import 'package:dart_mappable/dart_mappable.dart';

class DoubleHook extends MappingHook {
  const DoubleHook();

  @override
  double? beforeDecode(Object? value) {
    return value != null ? (value as num).toDouble() : null;
  }
}
