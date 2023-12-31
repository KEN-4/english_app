// flutter
import 'package:english_app/views/question_page.dart';
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// models
import 'package:english_app/models/main_model.dart';
// details
import 'package:english_app/details/rounded_button.dart';
// import 'package:english_app/details/rounded_text_field.dart';
// constants
import 'package:english_app/constants/strings.dart';
// QuestionScreen
import 'package:english_app/views/question_page.dart'; 

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key, required this.mainModel}) : super(key: key);
  final MainModel mainModel;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ("英語力を測ろう"),
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            RoundedButton(
              onPressed: () {
                // 問題ページへの遷移
                Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionPage()));
              },
              widthRate: 0.85,
              color: Colors.blue,
              text: "診断開始"  // クイズ開始ボタンのテキスト
            ),
          ],
        ),
      ),
    );
  }
}
