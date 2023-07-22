import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Option {
  String value;
  bool correct;
  Option({this.value = '', this.correct = false});
  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}

@JsonSerializable()
class Question {
  String text;
  List<Option> options;
  Question({this.options = const [], this.text = ''});
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Quiz {
  String id;
  String title;
  String description;
  String video;
  String category;
  List<Question> questions;

  Quiz(
      {this.title = '',
      this.video = '',
      this.description = '',
      this.id = '',
      this.category = '',
      this.questions = const []});
  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class Category {
  late final int id;
  final String title;
  final String description;
  final String img;
  final List<Quiz> quizzes;

  Category(
      {this.id = 0,
      this.title = '',
      this.description = '',
      this.img = 'default.png',
      this.quizzes = const []});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
  @override
  String toString() {
    return 'Category(id: $id, title: $title, description: $description, img: $img, quizzes: $quizzes)';
  }
}

@JsonSerializable()
class Report {
  String uid;
  int total;
  Map categories;

  Report({this.uid = '', this.categories = const {}, this.total = 0});
  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
