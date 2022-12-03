import 'package:runtime_type/runtime_type.dart';
import 'package:test/test.dart';

final throwsAssertionError = throwsA(isA<AssertionError>());
final throwsTypeError = throwsA(isA<TypeError>());

typedef NullableObject = Object?;

void main() {
  final testObjectType = RuntimeType<Object>();
  final testObjectNullableType = RuntimeType<Object?>();
  final testStringType = RuntimeType<String>();
  final testDynamicType = RuntimeType<dynamic>.allowingDynamic();
  final testIterableType = RuntimeType<Iterable<Object>>();
  final testListType = RuntimeType<List<Object>>();
  final testListOfStringType = RuntimeType<List<String>>();

  group('RuntimeType', () {
    test('warns on dynamic creation', () {
      RuntimeType<T> helper<T>() => RuntimeType();

      // ignore: inference_failure_on_instance_creation
      expect(RuntimeType.new, throwsAssertionError);
      // ignore: inference_failure_on_instance_creation
      expect(helper, throwsAssertionError);
      expect(RuntimeType<dynamic>.new, throwsAssertionError);

      expect(RuntimeType<Object>.new, returnsNormally);
      expect(helper<Object>, returnsNormally);

      // ignore: inference_failure_on_instance_creation
      expect(RuntimeType.allowingDynamic, returnsNormally);
    });

    test('internalType', () {
      expect(testObjectType.internalType, equals(Object));
      expect(testObjectNullableType.internalType, equals(NullableObject));

      expect(testStringType.internalType, equals(String));

      expect(testListType.internalType, equals(List<Object>));

      expect(testDynamicType.internalType, equals(dynamic));
    });

    test('isNullable', () {
      expect(testObjectType.isNullable, isFalse);
      expect(testObjectNullableType.isNullable, isTrue);

      expect(testStringType.isNullable, isFalse);

      expect(testDynamicType.isNullable, isTrue);
    });

    test('isSupertypeOf()', () {
      expect(testObjectType.isSupertypeOf(testStringType), isTrue);
      expect(testStringType.isSupertypeOf(testObjectType), isFalse);

      expect(testDynamicType.isSupertypeOf(testObjectType), isTrue);
      expect(testObjectType.isSupertypeOf(testDynamicType), isFalse);
      expect(testObjectNullableType.isSupertypeOf(testDynamicType), isTrue);

      expect(testIterableType.isSupertypeOf(testListType), isTrue);
      expect(testListType.isSupertypeOf(testListOfStringType), isTrue);
    });

    test('isSubtypeOf', () {
      expect(testObjectType.isSubtypeOf(testStringType), isFalse);
      expect(testStringType.isSubtypeOf(testObjectType), isTrue);

      expect(testDynamicType.isSubtypeOf(testObjectType), isFalse);
      expect(testObjectType.isSubtypeOf(testDynamicType), isTrue);
      expect(testObjectNullableType.isSubtypeOf(testDynamicType), isTrue);

      expect(testIterableType.isSubtypeOf(testListType), isFalse);
      expect(testListType.isSubtypeOf(testListOfStringType), isFalse);
    });

    test('isEquivalentTo()', () {
      expect(testObjectNullableType.isEquivalentTo(testDynamicType), isTrue);
      expect(testDynamicType.isEquivalentTo(testObjectNullableType), isTrue);

      expect(testObjectType.isEquivalentTo(testObjectType), isTrue);
      expect(testObjectType.isEquivalentTo(RuntimeType<Object>()), isTrue);

      expect(testObjectType.isEquivalentTo(testObjectNullableType), isFalse);
      expect(testObjectNullableType.isEquivalentTo(testObjectType), isFalse);

      expect(testObjectType.isEquivalentTo(testStringType), isFalse);

      expect(testListType.isEquivalentTo(testListOfStringType), isFalse);

      expect(RuntimeType<List<Object?>>().isEquivalentTo(RuntimeType<List<dynamic>>()), isTrue);
    });

    test('acceptsInstance()', () {
      expect(testObjectType.acceptsInstance(Object()), isTrue);
      expect(testObjectType.acceptsInstance('foo'), isTrue);
      expect(testObjectType.acceptsInstance(null), isFalse);

      expect(testObjectNullableType.acceptsInstance(Object()), isTrue);
      expect(testObjectNullableType.acceptsInstance('foo'), isTrue);
      expect(testObjectNullableType.acceptsInstance(null), isTrue);

      expect(testStringType.acceptsInstance(Object()), isFalse);
      expect(testStringType.acceptsInstance('foo'), isTrue);
      expect(testStringType.acceptsInstance(null), isFalse);

      expect(testListType.acceptsInstance(Object()), isFalse);
      expect(testListType.acceptsInstance([42, 'foo', #bar]), isTrue);
      expect(testListType.acceptsInstance(<Object?>['foo', null]), isFalse);
      expect(testListType.acceptsInstance(<dynamic>['foo', null]), isFalse);
      expect(testListType.acceptsInstance(['foo', 'bar', 'baz']), isTrue);

      expect(testListOfStringType.acceptsInstance(Object()), isFalse);
      expect(testListOfStringType.acceptsInstance([1, 'foo', #bar]), isFalse);
      expect(testListOfStringType.acceptsInstance(['foo', 'bar', 'baz']), isTrue);
    });

    test('castInstance()', () {
      final obj = Object();
      final str = 'foo';
      final list = [42, 'foo', #bar];

      expect(() => testObjectType.castInstance(obj), returnsNormally);
      expect(() => testObjectType.castInstance(str), returnsNormally);
      expect(() => testObjectType.castInstance(list), returnsNormally);
      expect(() => testObjectType.castInstance(null), throwsTypeError);

      expect(() => testObjectNullableType.castInstance(obj), returnsNormally);
      expect(() => testObjectNullableType.castInstance(str), returnsNormally);
      expect(() => testObjectNullableType.castInstance(list), returnsNormally);
      expect(() => testObjectNullableType.castInstance(null), returnsNormally);

      expect(() => testStringType.castInstance(obj), throwsTypeError);
      expect(() => testStringType.castInstance(str), returnsNormally);
      expect(() => testStringType.castInstance(list), throwsTypeError);
      expect(() => testStringType.castInstance(null), throwsTypeError);

      expect(() => testListType.castInstance(obj), throwsTypeError);
      expect(() => testListType.castInstance(str), throwsTypeError);
      expect(() => testListType.castInstance(list), returnsNormally);
      expect(() => testListType.castInstance(null), throwsTypeError);

      expect(() => testIterableType.castInstance(obj), throwsTypeError);
      expect(() => testIterableType.castInstance(str), throwsTypeError);
      expect(() => testIterableType.castInstance(list), returnsNormally);
      expect(() => testIterableType.castInstance(null), throwsTypeError);
    });

    test('nullable()', () {
      expect(testObjectType.nullable().internalType, equals(NullableObject));
      expect(testObjectType.nullable(), equals(testObjectNullableType));

      expect(testObjectNullableType.nullable(), equals(testObjectNullableType));
      expect(testDynamicType.nullable(), equals(testDynamicType));
    });

    test('==', () {
      expect(testObjectType == testObjectType, isTrue);
      expect(testObjectType == testObjectNullableType, isFalse);

      expect(testObjectType == RuntimeType<Object>(), isTrue);
      expect(testObjectType == RuntimeType<Object>.allowingDynamic(), isTrue);
    });
  });

  group('Common types', () {
    test('boolType', () {
      expect(boolType.internalType, equals(bool));
      expect(boolType.isNullable, isFalse);
    });

    test('doubleType', () {
      expect(doubleType.internalType, equals(double));
      expect(doubleType.isNullable, isFalse);
    });

    test('dynamicType', () {
      expect(dynamicType.internalType, equals(dynamic));
      expect(dynamicType.isNullable, isTrue);
    });

    test('enumType', () {
      expect(enumType.internalType, equals(Enum));
      expect(enumType.isNullable, isFalse);
    });

    test('intType', () {
      expect(intType.internalType, equals(int));
      expect(intType.isNullable, isFalse);
    });

    test('neverType', () {
      expect(neverType.internalType, equals(Never));
      expect(neverType.isNullable, isFalse);
    });

    test('nullType', () {
      expect(nullType.internalType, equals(Null));
      expect(nullType.isNullable, isTrue);
    });

    test('numType', () {
      expect(numType.internalType, equals(num));
      expect(numType.isNullable, isFalse);
    });

    test('objectType', () {
      expect(objectType.internalType, equals(Object));
      expect(objectType.isNullable, isFalse);
    });

    test('stringType', () {
      expect(stringType.internalType, equals(String));
      expect(stringType.isNullable, isFalse);
    });
  });

  group('RuntimeType extension', () {
    test('isOfType()', () {
      expect(Object().isOfType(testObjectType), isTrue);
      expect(Object().isOfType(testObjectNullableType), isTrue);
      expect(Object().isOfType(testDynamicType), isTrue);

      expect(null.isOfType(testObjectType), isFalse);
      expect(null.isOfType(testObjectNullableType), isTrue);
      expect(null.isOfType(testDynamicType), isTrue);
    });
  });

  test('castAs', () {
    expect(() => Object().castAs(testObjectType), returnsNormally);
    expect(() => Object().castAs(testObjectNullableType), returnsNormally);
    expect(() => Object().castAs(testDynamicType), returnsNormally);

    expect(() => null.castAs(testObjectType), throwsTypeError);
    expect(() => null.castAs(testObjectNullableType), returnsNormally);
    expect(() => null.castAs(testDynamicType), returnsNormally);
  });
}
