// flutter
import 'package:flutter/material.dart';
// package
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// constants
import 'package:english_app/constants/strings.dart';
import 'package:english_app/constants/routes.dart' as routes;
// domain
import 'package:english_app/domain/firestore_user/firestore_user.dart';

final mainProvider = ChangeNotifierProvider(
  (ref) => MainModel()
);
 
class MainModel extends ChangeNotifier {
  bool isLoading = false;
  User? currentUser;
  late DocumentSnapshot<Map<String,dynamic>> currentUserDoc;
  late FirestoreUser firestoreUser;
  //以下がMainModelが起動した時の処理
  // ユーザーの動作を必要としないモデルの関数
  MainModel() {
    init();
  }
  // initの中でcurrentUserを更新すれば良い
  Future<void> init() async {
    startLoading();
    // modelを跨がないでcurrentUserの更新
    currentUser = FirebaseAuth.instance.currentUser;
    // hcbXO8Rs4PPGua2vlPL92XTmpJj1
    currentUserDoc = await FirebaseFirestore.instance.collection(usersFieldKey).doc(currentUser!.uid).get();
    firestoreUser = FirestoreUser.fromJson(currentUserDoc.data()!);
    // currentUserのuidの取得が可能になりました
    endLoading();
  }
  void startLoading() {
    isLoading = true;
    notifyListeners();
  }
  void endLoading() {
    isLoading = false;
    notifyListeners();
  }
  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }
 
  Future<void> logout({required BuildContext context,required MainModel mainModel}) async {
    await FirebaseAuth.instance.signOut();
    setCurrentUser();
    routes.toLoginPage(context: context, mainModel: mainModel);
  }
}