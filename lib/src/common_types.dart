import 'package:runtime_type/runtime_type.dart';

/// The [bool] type represented as a [RuntimeType].
const RuntimeType<bool> boolType = RuntimeType.allowingDynamic();

/// The [double] type represented as a [RuntimeType].
const RuntimeType<double> doubleType = RuntimeType.allowingDynamic();

/// The [dynamic] type, represented as a [RuntimeType].
const RuntimeType<dynamic> dynamicType = RuntimeType.allowingDynamic();

/// The [enum] type, represented as a [RuntimeType].
const RuntimeType<Enum> enumType = RuntimeType.allowingDynamic();

/// The [int] type, represented as a [RuntimeType].
const RuntimeType<int> intType = RuntimeType.allowingDynamic();

/// The [never] type, represented as a [RuntimeType].
const RuntimeType<Never> neverType = RuntimeType.allowingDynamic();

/// The [Null] type, represented as a [RuntimeType].
// ignore: prefer_void_to_null
const RuntimeType<Null> nullType = RuntimeType.allowingDynamic();

/// The [num] type, represented as a [RuntimeType].
const RuntimeType<num> numType = RuntimeType.allowingDynamic();

/// The [object] type, represented as a [RuntimeType].
const RuntimeType<Object> objectType = RuntimeType.allowingDynamic();

/// The [string] type, represented as a [RuntimeType].
const RuntimeType<String> stringType = RuntimeType.allowingDynamic();
