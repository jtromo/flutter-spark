import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  group('Testing translations', () {
    test('should verify no translations are needed', () async {
      var input = await File('needs-translated.json').readAsString();
      Map<String, dynamic> json = jsonDecode(input);
      expect(json.isEmpty, true);
    });
  });
}
