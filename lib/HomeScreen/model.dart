
class QuizModel {
  QuizModel({
    num? responseCode,
    List<Results>? results,}){
    _responseCode = responseCode;
    _results = results;
  }

  QuizModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  num? _responseCode;
  List<Results>? _results;
  QuizModel copyWith({  num? responseCode,
    List<Results>? results,
  }) => QuizModel(  responseCode: responseCode ?? _responseCode,
    results: results ?? _results,
  );
  num? get responseCode => _responseCode;
  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// category : "Animals"
/// type : "multiple"
/// difficulty : "easy"
/// question : "What is the fastest  land animal?"
/// correct_answer : "Cheetah"
/// incorrect_answers : ["Lion","Thomson&rsquo;s Gazelle","Pronghorn Antelope"]

class Results {
  Results({
    String? category,
    String? type,
    String? difficulty,
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,}){
    _category = category;
    _type = type;
    _difficulty = difficulty;
    _question = question;
    _correctAnswer = correctAnswer;
    _incorrectAnswers = incorrectAnswers;
  }

  Results.fromJson(dynamic json) {
    _category = json['category'];
    _type = json['type'];
    _difficulty = json['difficulty'];
    _question = json['question'];
    _correctAnswer = json['correct_answer'];
    _incorrectAnswers = json['incorrect_answers'] != null ? json['incorrect_answers'].cast<String>() : [];
  }
  String? _category;
  String? _type;
  String? _difficulty;
  String? _question;
  String? _correctAnswer;
  List<String>? _incorrectAnswers;
  Results copyWith({  String? category,
    String? type,
    String? difficulty,
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
  }) => Results(  category: category ?? _category,
    type: type ?? _type,
    difficulty: difficulty ?? _difficulty,
    question: question ?? _question,
    correctAnswer: correctAnswer ?? _correctAnswer,
    incorrectAnswers: incorrectAnswers ?? _incorrectAnswers,
  );
  String? get category => _category;
  String? get type => _type;
  String? get difficulty => _difficulty;
  String? get question => _question;
  String? get correctAnswer => _correctAnswer;
  List<String>? get incorrectAnswers => _incorrectAnswers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = _category;
    map['type'] = _type;
    map['difficulty'] = _difficulty;
    map['question'] = _question;
    map['correct_answer'] = _correctAnswer;
    map['incorrect_answers'] = _incorrectAnswers;
    return map;
  }

}