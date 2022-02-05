import 'package:generic_validator/src/rule/validation_rule_base.dart';

import '../validation_result.dart';

/// A rule may represent a constraint, matcher..etc
class AsyncValidationRule<T, U> extends ValidationRuleBase<T, Future<ValidationResult<U>>> {
  /// A predicate that represents your rule
  final Future<bool> Function(T) ruler;
  final U negativeFeedback;

  AsyncValidationRule({required this.ruler, required this.negativeFeedback});

  /// Checks the state of the [value] according to the specified [ruler]
  @override
  Future<ValidationResult<U>> apply(T value) async{
    if (await ruler(value)) {
      return ValidationResult.valid();
    }
    return ValidationResult<U>.invalid(reasons: [negativeFeedback]);
  }
}