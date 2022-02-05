import 'package:generic_validator/src/rule/validation_rule.dart';
import 'package:generic_validator/src/validator/validator_base.dart';

mixin StringRules<Y> on ValidatorBase<String, Y> {
  ValidationRule<String, dynamic> notEmpty<U>({required U negativeFeedback}) {
    return ValidationRule<String, U>(
        ruler: (String value) {
          if (value.isNotEmpty) {
            return true;
          }
          return false;
        },
        negativeFeedback: negativeFeedback);
  }

  ValidationRule<String, dynamic> max<U>(
      {required int maxLength, required U negativeFeedback}) {
    return ValidationRule<String, U>(
        ruler: (String value) {
          if (value.length < maxLength) {
            return true;
          }
          return false;
        },
        negativeFeedback: negativeFeedback);
  }

  ValidationRule<String, dynamic> min<U>(
      {required int minLength, required U negativeFeedback}) {
    return ValidationRule<String, U>(
        ruler: (String value) {
          if (value.length >= minLength) {
            return true;
          }
          return false;
        },
        negativeFeedback: negativeFeedback);
  }
}
