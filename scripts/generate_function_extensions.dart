import 'dart:io';

void main() async {
  final outputFile = File('lib/src/function_extension.dart');
  final output = outputFile.openWrite(mode: FileMode.writeOnly);

  output
    ..writeln("import 'package:runtime_type/src/runtime_type.dart';")
    ..writeln()
    ..writeln('// This file is generated. Do not edit manually.')
    ..writeln('// Run scripts/generate_function_extensions.dart to regenerate this file.')
    ..writeln();

  for (int typeArgumentCount = 1; typeArgumentCount <= 5; typeArgumentCount++) {
    for (int argumentCount = 0; argumentCount <= 2; argumentCount++) {
      output.writeln(generateExtensionFor(typeArgumentCount, argumentCount));
    }
  }

  await output.close();

  Process.runSync('dart', ['format', '-l', '100', outputFile.path]);
}

String generateExtensionFor(int typeArgumentCount, int argumentCount) {
  assert(typeArgumentCount >= 1);
  assert(argumentCount >= 0);

  final typeArguments = Iterable.generate(typeArgumentCount, (index) => 'T$index').join(', ');
  final argumentTypes = Iterable.generate(argumentCount, (index) => 'U$index').join(', ');

  var typeArgumentsAndArgumentTypes = typeArguments;
  if (argumentTypes.isNotEmpty) {
    typeArgumentsAndArgumentTypes += ', $argumentTypes';
  }

  final runtimeTypeArguments =
      Iterable.generate(typeArgumentCount, (index) => 'RuntimeType<T$index> t$index').join(', ');
  final runtimeTypeArgumentReferences =
      Iterable.generate(typeArgumentCount, (index) => 't$index').join(', ');
  final underlyingArguments =
      Iterable.generate(argumentCount, (index) => 'U$index u$index').join(', ');
  final underlyingArgumentsReference =
      Iterable.generate(argumentCount, (index) => 'u$index').join(', ');
  var callMethodArguments = runtimeTypeArguments;
  if (underlyingArguments.isNotEmpty) {
    callMethodArguments += ', $underlyingArguments';
  }

  final tearoffTypeArguments =
      Iterable.generate(typeArgumentCount, (index) => 'S$index').join(', ');
  var body = 'this<$tearoffTypeArguments>';
  for (int index = 0; index < typeArgumentCount; index++) {
    body = 't$index.run(<S$index>() => $body)';
  }

  return '''
/// Additional [RuntimeType] functionality for [Function]s with $typeArgumentCount type arguments and $argumentCount arguments.
extension Function${argumentCount}TypeX$typeArgumentCount<R, $typeArgumentsAndArgumentTypes> on R Function<$typeArguments>($argumentTypes) {
  /// Return this function with its type parameters replaced by [t0]...`tn`.
  R Function($argumentTypes) withTypeArgument${typeArgumentCount == 1 ? '' : 's'}($runtimeTypeArguments) => $body;

  /// Call this function using [t0]...`tn` as its type parameters.
  R callWithTypeArgument${typeArgumentCount == 1 ? '' : 's'}($callMethodArguments) =>
      withTypeArgument${typeArgumentCount == 1 ? '' : 's'}($runtimeTypeArgumentReferences)($underlyingArgumentsReference);
}
''';
}
