import 'package:equatable/equatable.dart';
import 'package:generic_validator/src/rule/validation_rule_base.dart';

import '../validation_result.dart';

/// A rule may represent a constraint, matcher..etc
class ValidationRule<T, U> extends ValidationRuleBase<T, ValidationResult<U>>  with EquatableMixin{
  /// A predicate that represents your rule
  final bool Function(T) ruler;
  final U negativeFeedback;

  ValidationRule({required this.ruler, required this.negativeFeedback});

  /// Checks the state of the [value] according to the specified [ruler]
  @override
  ValidationResult<U> apply(T value) {
    if (ruler(value)) {
      return ValidationResult.valid();
    }
    return ValidationResult<U>.invalid(reasons: [negativeFeedback]);
  }

  @override
  List<Object?> get props => [ruler, negativeFeedback];
}
