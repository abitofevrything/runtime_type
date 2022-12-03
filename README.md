# runtime_type

A non-opaque representation of types at runtime.

Normally, `Type` objects are opaque and cannot be used for actual logic. `RuntimeType` allows for operations such as sub- or super-type checking, type checks, and casting using a variable instead of a literal.

To use, replace your type literals with calls to the `RuntimeType` constructor:
```dart
// Before
final stringType = String;
// After
final stringType = RuntimeType<String>();
```

### A word of warning

Please only use this library if you're sure it's what you want. If you're not completely at ease with the Dart language, ask someone who is whether your problem can be solved some other way, as Dart's type system is normally enough to handle problems.

### How it works

Instead of using `Type` instances to track information about a type, `RuntimeType` uses a generic type to hold the same information. Then, by using that generic and Dart's handling of generic subtype checking, we can implement most of the functions that normal type literals have.

If you've seen this trick before, this package uses the same principle:
```dart
bool isTypeASubtypeOfB<A, B>() => <A>[] is List<B>;
```

However, that trick does not work when `A` and `B` cannot be resolved statically - which is why this package creates `RuntimeType` objects statically, but which can then be passed around and used dynamically as the type information is help within the object itself.
