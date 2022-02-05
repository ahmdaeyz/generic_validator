import 'package:example/validators/platform_phone_validator.dart';
import 'package:generic_validator/generic_validator.dart';

class PhoneValidator extends AsyncValidator<String, dynamic> with StringRules<Future<ValidationResult>> {
  final PlatformPhoneValidator phoneValidator;

  PhoneValidator({required this.phoneValidator});
  @override
  List<ValidationRuleBase<String, dynamic>> get rules => [
        notEmpty(negativeFeedback: "This field can't be empty."),
        AsyncValidationRule(
            ruler: (value) async {
              try {
                if (await phoneValidator.validate(value)) {
                  return true;
                }
              } catch (e) {
                return false;
              }
              return false;
            },
            negativeFeedback: "Phone number isn't valid."),
      ];
}
