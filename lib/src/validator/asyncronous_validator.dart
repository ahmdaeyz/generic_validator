import 'package:generic_validator/src/rule/validation_rule_base.dart';
import 'package:generic_validator/src/validator/validator_base.dart';

import '../validation_result.dart';

/// A validator has [rules] which a value will be [validate]d against
///
/// [T] being the type of the value you are validating against.
///
/// [U] being the type of your negative feedback.
///
/// ```dart
/// class NameValidator extends AsyncValidator<String, String> {
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
abstract class AsyncValidator<T, U>
    extends ValidatorBase<T, Future<ValidationResult<U>>> {
  List<ValidationRuleBase<T, U>> get rules;

  @override
  Future<ValidationResult<U>> validate(T value) async {
    final futuristicInvalids = rules.map((e) async {
      final application = await e.apply(value);
      return application;
    }).toList();
    final invalids = (await Future.wait(futuristicInvalids.map((e) async => e)))
        .whereType<Invalid>()
        .toList();
    if (invalids.isNotEmpty) {
      return invalids.reduce((value, element) =>
              Invalid<U>(reasons: [...value.reasons, ...element.reasons]))
          as Invalid<U>;
    }

    return ValidationResult.valid();
  }
}
