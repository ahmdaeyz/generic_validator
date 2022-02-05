import 'package:example/validators/platform_phone_validator.dart';
import 'package:example/validators/sign_up_form_validator.dart';
import 'package:example/sign_up_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generic validator demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)),
      home: const SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var signUpFormKey = GlobalKey<FormState>();
  late final SignUpFormValidator formValidator;

  String? phoneValidation;

  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final platformPhoneValidator = PlatformPhoneValidatorImpl();
    formValidator =
        SignUpFormValidator(platformPhoneValidator: platformPhoneValidator);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: const Text(
            "Sign up",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Form(
                key: signUpFormKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      SignUpTextFormField(
                        labelText: "First Name",
                        icon: Icons.first_page,
                        validator: (val) =>
                            formValidator.nameValidator.validate(val!).maybeMap(
                                  invalid: (invalid) => invalid.reasons.first,
                                  orElse: () => null,
                                ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SignUpTextFormField(
                          labelText: "Last Name: ",
                          icon: Icons.last_page,
                          validator: (val) => formValidator.nameValidator
                              .validate(val!)
                              .maybeMap(
                                invalid: (invalid) => invalid.reasons.first,
                                orElse: () => null,
                              )),
                      const SizedBox(
                        height: 30,
                      ),
                      SignUpTextFormField(
                        labelText: "Email Address: ",
                        icon: Icons.email,
                        validator: (val) => formValidator.emailValidator
                            .validate(val!)
                            .maybeMap(
                              invalid: (invalid) => invalid.reasons.first,
                              orElse: () => null,
                            ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SignUpTextFormField(
                        controller: _phoneController,
                        labelText: "Phone Number: ",
                        icon: Icons.contact_phone,
                        onChange: (val) async {
                          await validatePhone(val);
                        },
                        validator: (val) => phoneValidation,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SignUpTextFormField(
                          labelText: "Password: ",
                          icon: Icons.password,
                          validator: (val) => formValidator.passwordValidator
                              .validate(val!)
                              .maybeMap(
                                invalid: (invalid) => invalid.reasons.first,
                                orElse: () => null,
                              )),
                      const SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () async {
                              await validatePhone(_phoneController.text);
                              signUpFormKey.currentState?.validate();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            )),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }

  Future<void> validatePhone(String val) async {
    (await formValidator.phoneValidator.validate(val)).maybeWhen(
      invalid: (reasons) {
        setState(() {
          phoneValidation = reasons.first;
        });
      },
      orElse: () {
        setState(() {
          phoneValidation = null;
        });
      },
    );
  }
}
