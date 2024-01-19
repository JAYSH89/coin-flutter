import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;

  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }

  return File('$dir/test/$name').readAsStringSync();

  // Optionally remove newlines and carriage returns if they are problematic
  // String sanitizedContent = fileContent
  //     .replaceAll('\n', '')
  //     .replaceAll('\r', '');
  //
  // return sanitizedContent;
}
