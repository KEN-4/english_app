import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_app/models/question.dart';

class FirebaseService {
  final CollectionReference questions = FirebaseFirestore.instance.collection('questions');

  Future<Question> getQuestion(String id) async {
    DocumentSnapshot snapshot = await questions.doc(id).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Question(
      audioUrl: data['audioUrl'],
      choices: List<String>.from(data['choices']),
      answer: data['answer'],
      scores: Map<String, int>.from(data['scores'])
    );
  }
}