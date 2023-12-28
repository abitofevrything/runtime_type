import 'package:runtime_type/src/runtime_type.dart';

// This file is generated. Do not edit manually.
// Run scripts/generate_function_extensions.dart to regenerate this file.

/// Additional [RuntimeType] functionality for [Function]s with 1 type arguments and 0 arguments.
extension Function0TypeX1<R, T0> on R Function<T0>() {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function() withTypeArgument(RuntimeType<T0> t0) => t0.run(<S0>() => this<S0>);

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArgument(RuntimeType<T0> t0) => withTypeArgument(t0)();
}

/// Additional [RuntimeType] functionality for [Function]s with 1 type arguments and 1 arguments.
extension Function1TypeX1<R, T0, U0> on R Function<T0>(U0) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function(U0) withTypeArgument(RuntimeType<T0> t0) => t0.run(<S0>() => this<S0>);

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArgument(RuntimeType<T0> t0, U0 u0) => withTypeArgument(t0)(u0);
}

/// Additional [RuntimeType] functionality for [Function]s with 1 type arguments and 2 arguments.
extension Function2TypeX1<R, T0, U0, U1> on R Function<T0>(U0, U1) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function(U0, U1) withTypeArgument(RuntimeType<T0> t0) => t0.run(<S0>() => this<S0>);

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArgument(RuntimeType<T0> t0, U0 u0, U1 u1) => withTypeArgument(t0)(u0, u1);
}

/// Additional [RuntimeType] functionality for [Function]s with 2 type arguments and 0 arguments.
extension Function0TypeX2<R, T0, T1> on R Function<T0, T1>() {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function() withTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1) =>
      t1.run(<S1>() => t0.run(<S0>() => this<S0, S1>));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1) => withTypeArguments(t0, t1)();
}

/// Additional [RuntimeType] functionality for [Function]s with 2 type arguments and 1 arguments.
extension Function1TypeX2<R, T0, T1, U0> on R Function<T0, T1>(U0) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function(U0) withTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1) =>
      t1.run(<S1>() => t0.run(<S0>() => this<S0, S1>));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, U0 u0) =>
      withTypeArguments(t0, t1)(u0);
}

/// Additional [RuntimeType] functionality for [Function]s with 2 type arguments and 2 arguments.
extension Function2TypeX2<R, T0, T1, U0, U1> on R Function<T0, T1>(U0, U1) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function(U0, U1) withTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1) =>
      t1.run(<S1>() => t0.run(<S0>() => this<S0, S1>));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, U0 u0, U1 u1) =>
      withTypeArguments(t0, t1)(u0, u1);
}

/// Additional [RuntimeType] functionality for [Function]s with 3 type arguments and 0 arguments.
extension Function0TypeX3<R, T0, T1, T2> on R Function<T0, T1, T2>() {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function() withTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2) =>
      t2.run(<S2>() => t1.run(<S1>() => t0.run(<S0>() => this<S0, S1, S2>)));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2) =>
      withTypeArguments(t0, t1, t2)();
}

/// Additional [RuntimeType] functionality for [Function]s with 3 type arguments and 1 arguments.
extension Function1TypeX3<R, T0, T1, T2, U0> on R Function<T0, T1, T2>(U0) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function(U0) withTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2) =>
      t2.run(<S2>() => t1.run(<S1>() => t0.run(<S0>() => this<S0, S1, S2>)));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2, U0 u0) =>
      withTypeArguments(t0, t1, t2)(u0);
}

/// Additional [RuntimeType] functionality for [Function]s with 3 type arguments and 2 arguments.
extension Function2TypeX3<R, T0, T1, T2, U0, U1> on R Function<T0, T1, T2>(U0, U1) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function(U0, U1) withTypeArguments(
          RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2) =>
      t2.run(<S2>() => t1.run(<S1>() => t0.run(<S0>() => this<S0, S1, S2>)));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(
          RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2, U0 u0, U1 u1) =>
      withTypeArguments(t0, t1, t2)(u0, u1);
}

/// Additional [RuntimeType] functionality for [Function]s with 4 type arguments and 0 arguments.
extension Function0TypeX4<R, T0, T1, T2, T3> on R Function<T0, T1, T2, T3>() {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function() withTypeArguments(
          RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2, RuntimeType<T3> t3) =>
      t3.run(<S3>() => t2.run(<S2>() => t1.run(<S1>() => t0.run(<S0>() => this<S0, S1, S2, S3>))));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(
          RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2, RuntimeType<T3> t3) =>
      withTypeArguments(t0, t1, t2, t3)();
}

/// Additional [RuntimeType] functionality for [Function]s with 4 type arguments and 1 arguments.
extension Function1TypeX4<R, T0, T1, T2, T3, U0> on R Function<T0, T1, T2, T3>(U0) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function(U0) withTypeArguments(
          RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2, RuntimeType<T3> t3) =>
      t3.run(<S3>() => t2.run(<S2>() => t1.run(<S1>() => t0.run(<S0>() => this<S0, S1, S2, S3>))));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(
          RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2, RuntimeType<T3> t3, U0 u0) =>
      withTypeArguments(t0, t1, t2, t3)(u0);
}

/// Additional [RuntimeType] functionality for [Function]s with 4 type arguments and 2 arguments.
extension Function2TypeX4<R, T0, T1, T2, T3, U0, U1> on R Function<T0, T1, T2, T3>(U0, U1) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function(U0, U1) withTypeArguments(
          RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2, RuntimeType<T3> t3) =>
      t3.run(<S3>() => t2.run(<S2>() => t1.run(<S1>() => t0.run(<S0>() => this<S0, S1, S2, S3>))));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2,
          RuntimeType<T3> t3, U0 u0, U1 u1) =>
      withTypeArguments(t0, t1, t2, t3)(u0, u1);
}

/// Additional [RuntimeType] functionality for [Function]s with 5 type arguments and 0 arguments.
extension Function0TypeX5<R, T0, T1, T2, T3, T4> on R Function<T0, T1, T2, T3, T4>() {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function() withTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2,
          RuntimeType<T3> t3, RuntimeType<T4> t4) =>
      t4.run(<S4>() => t3.run(<S3>() =>
          t2.run(<S2>() => t1.run(<S1>() => t0.run(<S0>() => this<S0, S1, S2, S3, S4>)))));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2,
          RuntimeType<T3> t3, RuntimeType<T4> t4) =>
      withTypeArguments(t0, t1, t2, t3, t4)();
}

/// Additional [RuntimeType] functionality for [Function]s with 5 type arguments and 1 arguments.
extension Function1TypeX5<R, T0, T1, T2, T3, T4, U0> on R Function<T0, T1, T2, T3, T4>(U0) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function(U0) withTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2,
          RuntimeType<T3> t3, RuntimeType<T4> t4) =>
      t4.run(<S4>() => t3.run(<S3>() =>
          t2.run(<S2>() => t1.run(<S1>() => t0.run(<S0>() => this<S0, S1, S2, S3, S4>)))));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2,
          RuntimeType<T3> t3, RuntimeType<T4> t4, U0 u0) =>
      withTypeArguments(t0, t1, t2, t3, t4)(u0);
}

/// Additional [RuntimeType] functionality for [Function]s with 5 type arguments and 2 arguments.
extension Function2TypeX5<R, T0, T1, T2, T3, T4, U0, U1> on R Function<T0, T1, T2, T3, T4>(U0, U1) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function(U0, U1) withTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2,
          RuntimeType<T3> t3, RuntimeType<T4> t4) =>
      t4.run(<S4>() => t3.run(<S3>() =>
          t2.run(<S2>() => t1.run(<S1>() => t0.run(<S0>() => this<S0, S1, S2, S3, S4>)))));

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArguments(RuntimeType<T0> t0, RuntimeType<T1> t1, RuntimeType<T2> t2,
          RuntimeType<T3> t3, RuntimeType<T4> t4, U0 u0, U1 u1) =>
      withTypeArguments(t0, t1, t2, t3, t4)(u0, u1);
}
