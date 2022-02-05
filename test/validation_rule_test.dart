import 'package:generic_validator/generic_validator.dart';
import 'package:test/test.dart';

void main() {
  group("test rule application", () {
    test("returns valid on ruler is true", () async{
      final validationRule = ValidationRule(
          ruler: (value) {
            return true;
          },
          negativeFeedback: "");
      expect(validationRule.apply(anything), isA<Valid>());
    });

    test("returns invalid on ruler is false", () async{
      final validationRule = ValidationRule(
          ruler: (value) {
            return false;
          },
          negativeFeedback: "");
      expect(validationRule.apply(anything), isA<Invalid>());
    });
    
    test(
        "returns a validation result of the same type of negative feedback on ruler is false",
        ()async {
      final negativeFeedback = "";
      final validationRule = ValidationRule(
          ruler: (value) {
            return false;
          },
          negativeFeedback: negativeFeedback);
      final actualResult = validationRule.apply(anything);
      expect(actualResult, isA<Invalid<String>>());
    });
  });
}
