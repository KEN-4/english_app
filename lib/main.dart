import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:english_app/details/sns_bottom_navigation_bar.dart';
import 'package:english_app/views/login_page.dart';
// models
import 'package:english_app/models/main_model.dart';
import 'package:english_app/models/sns_bottom_navigation_bar_model.dart';
// options
import 'firebase_options.dart';
// constants
// import 'package:english_app/constants/routes.dart' as routes;
import 'package:english_app/constants/strings.dart';
// components
import 'package:english_app/views/main/home_screen.dart';
import 'package:english_app/views/main/profile_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MyAppが起動した最初の時にユーザーがログインしているかどうかの確認
    // この変数を1回きり
    final User? onceUser = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onceUser == null ?
      const LoginPage() : 
      const MyHomePage(title: appTitle),
    );
  }
}
 
class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    Key? key, 
    required this.title
  }) : super(key: key);
  final String title;
 
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);
    final SNSBottomNavigationBarModel snsBottomNavigationBarModel = ref.watch(snsBottomNavigationBarProvider);
 
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mainModel.isLoading ?
        const Center(
          child: Text(loadingText),
        ) : 
        PageView(
          controller: snsBottomNavigationBarModel.pageController,
          onPageChanged: (index) => snsBottomNavigationBarModel.onPageChanged(index: index),
          // childrenの個数はElementsの数
          children: [
            // 注意：ページじゃないのでScaffold
            HomeScreen(mainModel: mainModel,),
            ProfileScreen(mainModel: mainModel,),
          ],
        ),
      bottomNavigationBar: SNSBottomNavigationBar(snsBottomNavigationBarModel: snsBottomNavigationBarModel),
    );
  }
}
