import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:formula_quiz/services/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formula_quiz/services/auth.dart';


class FirestoreService {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Category>> getCategories() async {
    var ref = _db.collection('categories');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var categories = data.map((d) => Category.fromJson(d));
    return categories.toList();
  }

  /// Retrieves a single quiz document
  Future<Quiz> getQuiz(String quizId) async {
    var ref = _db.collection('quizzes').doc(quizId);
    var snapshot = await ref.get();
    return Quiz.fromJson(snapshot.data() ?? {});
  }

    /// Listens to current user's report document in Firestore
  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  /// Updates the current user's report document after completing quiz
  Future<void> updateUserReport(Quiz quiz) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {
      'total': FieldValue.increment(1),
      'categories': {
        quiz.category: FieldValue.arrayUnion([quiz.id])
      }
    };

    return ref.set(data, SetOptions(merge: true));
  }

}