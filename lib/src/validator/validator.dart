import 'package:generic_validator/src/rule/validation_rule.dart';
import 'package:generic_validator/src/validator/validator_base.dart';

import '../validation_result.dart';

/// A validator has [rules] which a value will be [validate]d against
///
/// [T] being the type of the value you are validating against.
///
/// [U] being the type of your negative feedback.
///
/// ```dart
/// class NameValidator extends Validator<String, String> {
///
///  @override
///  List<ValidationRule<String, String>> get rules => [
///        ValidationRule(
///            ruler: (value) => value.isNotEmpty,
///            negativeFeedback: "Name can't be empty."),
///        ValidationRule(
///            ruler: (value) => value.length <= 20,
///            negativeFeedback: "Name can't be more than 20 characters.")
///      ];
///}
/// ```
abstract class Validator<T, U> extends ValidatorBase<T, ValidationResult<U>> {
  List<ValidationRule<T, U>> get rules;

  @override
  ValidationResult<U> validate(T value) {
    final invalids =
        rules.map((e) => e.apply(value)).whereType<Invalid>().toList();
    if (invalids.isNotEmpty) {
      return invalids.reduce((value, element) =>
              Invalid<U>(reasons: [...value.reasons, ...element.reasons]))
          as Invalid<U>;
    }

    return ValidationResult.valid();
  }
}
