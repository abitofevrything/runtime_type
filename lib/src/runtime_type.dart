/// A non-opaque representation of a [Type] that can be used at runtime.
///
/// {@template runtime_type}
/// Normally, [Type] objects are opaque and cannot be used for actual logic. [RuntimeType] allows
/// for operations such as sub- or super-type checking, type checks, and casting using a variable
/// instead of a literal.
///
/// To use, replace your type literals with calls to the [RuntimeType] constructor:
/// ```dart
/// // Before
/// final stringType = String;
///
/// // After
/// final stringType = RuntimeType<String>();
/// ```
///
/// Though it adds support for some operations, [RuntimeType] is not a replacement for type
/// literals. For example, it cannot be used as a type argument as they are required to be type
/// literals. Additionally, [RuntimeType] can be *used* at runtime to perform operations on types
/// but it cannot extract type information at runtime:
/// ```dart
/// final something = 'foo' as dynamic;
///
/// RuntimeType<T> extractType<T>(T instance) => RuntimeType<T>();
///
/// final typeOfSomething = extractType(something); // Still dynamic
/// ```
/// {@endtemplate}
class RuntimeType<T> {
  /// Create a new [RuntimeType] representing `T`.
  ///
  /// To create constant [RuntimeType]s, use the [RuntimeType.allowingDynamic] constructor.
  ///
  /// {@macro runtime_type}
  RuntimeType()
      : assert(
          T != dynamic,
          'A RuntimeType instance was created with dynamic as the type argument. This is most'
          ' likely a mistake. RuntimeType instances can be used at runtime, but cannot be'
          ' dynamically created and a common symptom of this is dynamic being implicitly passed as'
          ' a type argument. Try using explicit type parameters, the Object? type instead of'
          ' dynamic, or, if this is intentional, use the RuntimeType.allowingDynamic()'
          ' constructor.',
        );

  /// Create a new [RuntimeType] representing `T`, allowing `dynamic` as a valid value for `T`.
  ///
  /// Only use this constructor if you want a constant [RuntimeType]. If you want a [RuntimeType]
  /// representing `dynamic`, consider using [dynamicType] instead.
  ///
  /// {@macro runtime_type}
  const RuntimeType.allowingDynamic();

  /// The [Type] that this [RuntimeType] represents.
  ///
  /// Use this if you're trying to use `dart:mirrors` and reflect this type.
  Type get internalType => T;

  /// Whether this type is nullable.
  ///
  /// This is the difference between `T?` and `T`:
  /// ```dart
  /// RuntimeType<String>(); // Non-nullable
  /// RuntimeType<String?>(); // Nullable
  /// ```
  ///
  /// Note that `dynamic` and `Null` are nullable despite not having the nullable `?` suffix.
  bool get isNullable => acceptsInstance(null);

  /// Whether this is a supertype of [other].
  ///
  /// A class `B` is a supertype of `A` if an instance of `A` is assignable to `B`. For example,
  /// `Iterable` is a supertype of `List`, but not a supertype of `String`.
  ///
  /// Note that a given class `T` is considered a supertype of itself.
  bool isSupertypeOf<U>(RuntimeType<U> other) => other is RuntimeType<T>;

  /// Whether this is a subtype of [other].
  ///
  /// A class `B` is a subtype of `A` if an instance of `B` is assignable to `A`. For example,
  /// `List` is a subtype of `Iterable`, but not a subtype of `String`.
  ///
  /// Note that a given class `T` is considered to be a subtype of itself.
  bool isSubtypeOf<U>(RuntimeType<U> other) => other.isSupertypeOf(this);

  /// Whether this type is equivalent to [other].
  ///
  /// Unlike [Type.operator==], this returns `true` if `this` and [other] are subtypes of each
  /// other. The most obvious scenario where this is true is when `this == other`, but other cases,
  /// such as `dynamic` and `Object?` do exist.
  bool isEquivalentTo<U>(RuntimeType<U> other) => other.isSupertypeOf(this) && isSupertypeOf(other);

  /// Whether [instance] can be assigned to this type.
  ///
  /// This is similar to the `is` operator, which can be replaced as such, using [stringType] as an
  /// example:
  /// ```dart
  /// // Before
  /// if (instance is String) {
  ///   // Do some logic here
  /// }
  ///
  /// // After
  /// if (stringType.acceptsInstance(instance)) {
  ///   // Do some logic here
  /// }
  /// ```
  ///
  /// Note that unlike the `is` operator, this method does not type-promote. If you want to
  /// type-promote, consider using [withInstance] instead.
  bool acceptsInstance(dynamic instance) => instance is T;

  /// Run [process] with [value] if [value] is assignable to this type.
  ///
  /// [otherwise] can be provided and will be ran if [value] is not assignable to this type. This is
  /// similar to an `if (instance is ...) { ... } else { ... }` statement:
  /// ```dart
  /// // Before
  /// if (instance is String) {
  ///   // Do something
  /// } else {
  ///   // Do something else
  /// }
  ///
  /// // After
  /// stringType.withInstance(
  ///   instance,
  ///   (instance) {
  ///     // Do something with instance, now promoted to a String
  ///   },
  ///   otherwise: (instance) {
  ///     // Do something else
  ///   },
  /// );
  /// ```
  void withInstance<U, R>(
    U value,
    void Function(T value) process, {
    void Function(U value)? otherwise,
  }) {
    if (value is T) {
      process(value);
    } else {
      if (otherwise == null) return;
      otherwise(value);
    }
  }

  /// Cast [instance] to this type, throwing if the cast fails.
  ///
  /// This is similar to the `as` language operator:
  /// ```dart
  /// // Before
  /// final castInstance = instance as String;
  ///
  /// // After
  /// final castInstance = stringType.castInstance(instance);
  /// ```
  T castInstance(dynamic instance) => instance as T;

  /// Return a nullable version of this [RuntimeType].
  ///
  /// If this type is already nullable, the returned type will be equal to this type.
  RuntimeType<T?> nullable() => RuntimeType<T?>.allowingDynamic();

  @override
  int get hashCode => internalType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RuntimeType && other.internalType == internalType) ||
      (other is Type && internalType == other);

  @override
  String toString() => 'RuntimeType<$internalType>';
}
