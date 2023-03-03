import 'dart:mirrors';

import 'package:runtime_type/runtime_type.dart';

/// Additional [RuntimeType] functionality for [Type] objects.
extension TypeRuntimeType on Type {
  /// Create a [RuntimeType] representing this [Type].
  RuntimeType<dynamic> toRuntimeType() =>
      (reflectType(RuntimeType, [this]) as ClassMirror).newInstance(
        // Use the allowingDynamic constructor in case this type is dynamic.
        #allowingDynamic,
        [],
      ).reflectee as RuntimeType;
}

/// Additional [RuntimeType] functionality for all objects.
extension ObjectRuntimeType<T> on T {
  /// Create a [RuntimeType] representing this object's type.
  ///
  /// This is like the [runtimeType] property, but returns a [RuntimeType] instead of a [Type].
  RuntimeType<T> getRuntimeType() => runtimeType.toRuntimeType() as RuntimeType<T>;
}

/// Additional `dart:mirrors` functionality for [RuntimeType] objects.
extension RuntimeTypeMirrors<T> on RuntimeType<T> {
  /// Get a [TypeMirror] representing this type.
  TypeMirror reflect() => reflectType(internalType);
}

/// Additional [RuntimeType] functionality for [TypeMirror] objects.
extension RuntimeTypeMirror on TypeMirror {
  /// Convert this [TypeMirror] to a [RuntimeType].
  ///
  /// This is like the [reflectedType] property, bur returns a [RuntimeType] instead of a [Type].
  RuntimeType<dynamic> toRuntimeType() => reflectedType.toRuntimeType();
}
