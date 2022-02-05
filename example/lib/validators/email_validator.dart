import 'package:generic_validator/generic_validator.dart';

class EmailValidator extends Validator<String, dynamic> with StringRules {
  @override
  List<ValidationRule<String, dynamic>> get rules => [
        notEmpty<String>(negativeFeedback: "This field can't be empty."),
        ValidationRule(
            ruler: (value) {
              if (RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                  .hasMatch(value)) {
                return true;
              }
              return false;
            },
            negativeFeedback: "Email has to be valid."),
      ];
  
}
