// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// components
import 'package:english_app/details/rounded_text_field.dart';
import 'package:english_app/details/rounded_password_field.dart';
import 'package:english_app/details/rounded_button.dart';
// model
import 'package:english_app/models/login_model.dart';
// constants
import 'package:english_app/constants/strings.dart';
import 'package:english_app/constants/routes.dart';

class QuestionPage extends ConsumerWidget {
  const QuestionPage({
    Key? key,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider);
    final TextEditingController emailEditingController = TextEditingController(text: loginModel.email);
    final TextEditingController passwordEditingController = TextEditingController(text: loginModel.password);
    return Scaffold(
      appBar: AppBar(
        title: const Text(loginTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            controller: emailEditingController,
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => loginModel.email = text,
            borderColor: Colors.black,
            shadowColor: Colors.red.withOpacity(0.3),
            hintText: mailAddressText
          ),
          RoundedPasswordField(
            onChanged: (text) => loginModel.password = text,
            passwordEditingController: passwordEditingController, 
            obscureText: loginModel.isObscure, 
            toggleObscureText: () => loginModel.toggleIsObscure(),
            borderColor: Colors.black, 
            shadowColor: Colors.blue.withOpacity(0.3),
          ),
          RoundedButton(
            onPressed: () async => await loginModel.login(context: context),
            widthRate: 0.85, 
            color: Colors.green,
            text: loginText
          ),
          RoundedButton(
            onPressed: ()  => toSignupPage(context: context),
            widthRate: 0.85, 
            color: Colors.grey,
            text: signupText
          ),
        ],
      ),
    );
  }
}