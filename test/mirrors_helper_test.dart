import 'dart:mirrors';

import 'package:runtime_type/mirrors.dart';
import 'package:runtime_type/runtime_type.dart';
import 'package:test/test.dart';

typedef NullableObject = Object?;

class Test {}

void main() {
  group('TypeRuntimeType', () {
    test('toRuntimeType()', () {
      expect((Object).toRuntimeType(), equals(objectType));
      expect((dynamic).toRuntimeType(), equals(dynamicType));
      expect((NullableObject).toRuntimeType(), equals(objectType.nullable()));
    });
  });

  group('ObjectRuntimeType', () {
    test('getRuntimeType', () {
      expect(Object().getRuntimeType(), equals(objectType));
      expect(Test().getRuntimeType(), equals(RuntimeType<Test>()));
    });
  });

  group('RuntimeTypeMirrors', () {
    test('reflect', () {
      expect(objectType.reflect(), equals(reflectType(Object)));
      expect(RuntimeType<Test>().reflect(), equals(reflectType(Test)));
    });
  });

  group('RuntimeTypeMirror', () {
    test('toRuntimeType', () {
      expect(reflectType(Object).toRuntimeType(), equals(objectType));
      expect(reflectType(Test).toRuntimeType(), equals(RuntimeType<Test>()));
    });
  });
}
