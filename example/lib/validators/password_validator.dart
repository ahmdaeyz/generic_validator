import 'package:generic_validator/generic_validator.dart';

class PasswordValidator extends Validator<String, dynamic> with StringRules {
  @override
  List<ValidationRule<String, dynamic>> get rules => [
        notEmpty<String>(negativeFeedback: "This field can't be empty."),
        max(
            maxLength: 16,
            negativeFeedback: "Password can't be more than 16 characters."),
        min(
            minLength: 8,
            negativeFeedback: "Password can't be less than 8 characters.")
      ];

}
