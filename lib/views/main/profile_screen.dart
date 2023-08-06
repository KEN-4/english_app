// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// models
import 'package:english_app/models/main_model.dart';
// details
import 'package:english_app/details/rounded_button.dart';
import 'package:english_app/details/rounded_text_field.dart';
// constants
import 'package:english_app/constants/strings.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          Text(
            ("あなたのIDは${mainModel.firestoreUser.uid}です"),
            style: const TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          RoundedButton(
              onPressed: () async => await mainModel.logout(
                  context: context, mainModel: mainModel),
              widthRate: 0.85,
              color: Colors.red,
              text: logoutText),
      ],
    );
  }
}