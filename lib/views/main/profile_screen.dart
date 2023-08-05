// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// models
import 'package:english_app/models/main_model.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    Key? key,
    required this.mainModel
  }) : super(key: key);
  final MainModel mainModel;
  @override 
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            mainModel.firestoreUser.email,
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ],
    );
  }
}