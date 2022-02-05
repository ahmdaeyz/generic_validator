import 'package:phone_number/phone_number.dart';

abstract class PlatformPhoneValidator {
  Future<bool> validate(String phone);
}

class PlatformPhoneValidatorImpl extends PlatformPhoneValidator {
  final PhoneNumberUtil _plugin = PhoneNumberUtil();

  @override
  Future<bool> validate(String phone) async {
    return await _plugin.validate(phone, '+20');
  }
}
