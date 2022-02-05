import 'package:generic_validator/generic_validator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class NameValidator extends Validator<String, dynamic> {
  @override
  List<ValidationRule<String, dynamic>> get rules => [
        ValidationRule(
            ruler: (value)  => value.isNotEmpty,
            negativeFeedback: "Name can't be empty."),
        ValidationRule(
            ruler: (value) {
              if (RegExp("[A-Za-z]").hasMatch(value)) {
                return true;
              }
              return false;
            },
            negativeFeedback: "Name has to be in English"),
        ValidationRule(
            ruler: (value)  => value.length <= 8,
            negativeFeedback: "Name can't be more than 20 characters.")
      ];
}

void main() {
  group("test validator", () {
    NameValidator? validator;
    setUp(() {
      validator = NameValidator();
    });
    test("returns valid when all the rules match", () async{
      final goodName = "Ahmed";
      final actualResult =await  validator?.validate(goodName);
      expect(actualResult, isA<Valid>());
    });

    test("returns invalid when a rule doesn't match", () async{
      final badName = "";
      final actualResult = await validator?.validate(badName);
      expect(actualResult, isA<Invalid>());
    });

    test("returns the same number of reasons as the number of invalid rules",
        () async{
      final badName = "احمد محمد احمد";
      final numberOfViolatedRules = 2;
      final actualResult = await validator?.validate(badName);
      final reasons = actualResult?.maybeMap(
          invalid: (invalid) => invalid.reasons, orElse: () => null);
      expect(reasons?.length, numberOfViolatedRules);
    });
  });
}
