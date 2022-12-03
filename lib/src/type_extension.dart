import 'package:runtime_type/runtime_type.dart';

/// Provides extensions to allow [RuntimeType]s appear more similar to the core Dart language.
extension RuntimeTypeX on Object? {
  /// An alias for `type.acceptsInstance(this)`.
  ///
  /// This makes [RuntimeType.acceptsInstance] appear like the `is` operator. Instead of
  /// `type.acceptsInstance(instance)`, use `instance.isOfType(type)`.
  bool isOfType<U>(RuntimeType<U> type) => type.acceptsInstance(this);

  /// An alias for `type.castInstance(this)`.
  ///
  /// This makes [RuntimeType.castInstance] appear like the `as` operator. Instead of
  /// `type.castInstance(instance)`, use `instance.castAs(type)`.
  U castAs<U>(RuntimeType<U> type) => type.castInstance(this);
}
