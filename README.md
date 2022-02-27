[![pub package](https://img.shields.io/pub/v/generic_validator.svg)](https://pub.dev/packages/generic_validator)
[![likes](https://badges.bar/generic_validator/likes)](https://pub.dev/packages/generic_validator/score)

This package provides APIs to facilitate separating validation and business rules from the application presentation.

## Features

- Express your rules in a declarative way. 
- Feedback doesn't have to be of a certain type (totally generic)
- Group related rules together and eliminate if else statements.
- Supports asynchronous evalution of rules.

## Usage

### Check `/example` for a full detailed usage.
#
You can declare a `ValidationRule`  with a `ruler` which encapsulates your validation and of course the `negativeFeedback` of your choice which can be of any type then call `apply` on it.

```dart
final myName = 'Ahmed';
final arabicName = 'احمد';
final nameRule = ValidationRule(
            ruler: (value) {
              if (RegExp("[A-Za-z]").hasMatch(value)) {
                return true;
              }
              return false;
            },
            negativeFeedback: "Name has to be in English");
final validResult = nameRule.apply(myName); // Returns Valid
final invalidResult = nameRule.apply(arabicName); // Returns Invalid which has a reasons property of the type of the negative feedback passed earlier.
```
#
Grouping rules together can be convenient in that case, you can subclass the `Validator` and override its `rules` getter declaring your rules. 

```dart

class NameValidator extends Validator<String, dynamic> {
  @override
  List<ValidationRule<String, dynamic>> get rules => [
      ValidationRule(
            ruler: (value) {
              if (value.isNotEmpty){
                return true;
              }
              return false;
            },
            negativeFeedback: "Name can't be empty"),
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

```

Call `validate` on it to get the result:

```dart 
  
  final aValidName = "Ahmed";
  final invalidName = "";
  final nameValidator = NameValidator();
  final validResult = nameValidator.validate(aValidName); // Returns Valid
  final invalidResult = nameValidator.validate(invalidName); // Returns Invalid with a reasons property

```
You can also mixin `StringRules` which has common rules like `notEmpty`

```dart
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
```

#
You can create both an `AsyncValidationRule` and an `AsyncValidator` which can have both `ValidationRule` and `AsyncValidationRules` rules.
#
A validation result have a couple of convient methods like `when`, `maybeWhen`, `map`, and `maybeMap`. for usages like:

```dart
// Map validation result objects to String or null for use with the TextFormfield validator function.
nameValidator.validate(val).maybeMap(
    invalid: (invalid) => invalid.reasons.first,
    orElse: () => null,
);
// Side effects based on a validation result.
phoneValidator.validate(val).maybeWhen(
      invalid: (reasons) {
        // show a dialog
      },
      orElse: () {
        // pop the current screen
      },
);
```
