/// A non-opaque representation of types at runtime.
///
/// Normally, `Type` objects are opaque and cannot be used for actual logic. `RuntimeType` allows for operations such as sub- or super-type checking, type checks, and casting using a variable instead of a literal.
///
/// To use, replace your type literals with calls to the `RuntimeType` constructor:
/// ```dart
/// // Before
/// final stringType = String;
/// // After
/// final stringType = RuntimeType<String>();
/// ```
library runtime_type;

export 'src/runtime_type.dart';
export 'src/common_types.dart';
export 'src/type_extension.dart';
