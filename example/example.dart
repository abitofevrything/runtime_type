import 'package:runtime_type/runtime_type.dart';

// This is just an example. If you actually want to implement a class like `Value`, just use
// generics :)

class Value<T> {
  Object? _value;

  T get value => _value.castAs(type);

  set value(Object? newValue) {
    if (!newValue.isOfType(type)) {
      throw Exception("$newValue can't be assigned to $type!");
    }

    _value = newValue;
  }

  final RuntimeType<T> type;

  Value(this.type, this._value);
}

void main() {
  final stringValue = Value(stringType, 'foo');
  final intValue = Value(intType, 42);

  final numValue = Value(numType, 17.0);

  /// `numType` accepts the `int` returned by `intValue`
  numValue.value = intValue.value;

  // This, however, will throw
  stringValue.value = 17;

  // While we can initialise a value to an invalid one, accessing it will cause `stringType` to
  // throw an error
  final invalidValue = Value(stringType, 15);
  print(invalidValue.value); // Throws
}
