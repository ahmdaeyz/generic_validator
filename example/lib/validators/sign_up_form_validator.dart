import 'package:example/validators/platform_phone_validator.dart';
import 'package:example/validators/email_validator.dart';
import 'package:example/validators/name_validator.dart';
import 'package:example/validators/password_validator.dart';
import 'package:example/validators/phone_validator.dart';

class SignUpFormValidator {
  final PlatformPhoneValidator platformPhoneValidator;
  final NameValidator nameValidator = NameValidator();
  final PasswordValidator passwordValidator = PasswordValidator();
  late final PhoneValidator phoneValidator;
  final EmailValidator emailValidator = EmailValidator();

  SignUpFormValidator({required this.platformPhoneValidator}) {
    phoneValidator = PhoneValidator(phoneValidator: platformPhoneValidator);
  }
}
