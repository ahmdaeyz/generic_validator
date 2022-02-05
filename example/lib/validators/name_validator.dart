import 'package:generic_validator/generic_validator.dart';

class NameValidator extends Validator<String, dynamic> with StringRules {
  @override
  List<ValidationRule<String, dynamic>> get rules => [
        notEmpty<String>(negativeFeedback: "This field can't be empty."),
        max(
            maxLength: 10,
            negativeFeedback: "Name can't be more than 10 characters."),
        ValidationRule(
            ruler: (value) {
              if (RegExp("[A-Za-z]").hasMatch(value)) {
                return true;
              }
              return false;
            },
            negativeFeedback: "Name has to be in English"),
      ];
}
