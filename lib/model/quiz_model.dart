class QuizModel {
  int _sTATUSCODE;
  String _mESSAGE;
  DATA _dATA;

  QuizModel({int sTATUSCODE, String mESSAGE, DATA dATA}) {
    this._sTATUSCODE = sTATUSCODE;
    this._mESSAGE = mESSAGE;
    this._dATA = dATA;
  }

  int get sTATUSCODE => _sTATUSCODE;
  set sTATUSCODE(int sTATUSCODE) => _sTATUSCODE = sTATUSCODE;
  String get mESSAGE => _mESSAGE;
  set mESSAGE(String mESSAGE) => _mESSAGE = mESSAGE;
  DATA get dATA => _dATA;
  set dATA(DATA dATA) => _dATA = dATA;

  QuizModel.fromJson(Map<String, dynamic> json) {
    _sTATUSCODE = json['STATUS_CODE'];
    _mESSAGE = json['MESSAGE'];
    _dATA = json['DATA'] != null ? new DATA.fromJson(json['DATA']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATUS_CODE'] = this._sTATUSCODE;
    data['MESSAGE'] = this._mESSAGE;
    if (this._dATA != null) {
      data['DATA'] = this._dATA.toJson();
    }
    return data;
  }
}

class DATA {
  List<Questions> _questions;

  DATA({List<Questions> questions}) {
    this._questions = questions;
  }

  List<Questions> get questions => _questions;
  set questions(List<Questions> questions) => _questions = questions;

  DATA.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      _questions = new List<Questions>();
      json['questions'].forEach((v) {
        _questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._questions != null) {
      data['questions'] = this._questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int _questionId;
  String _question;
  String _ansA;
  String _ansB;
  String _ansC;
  String _ansD;
  String _answer;

  Questions(
      {int questionId,
      String question,
      String ansA,
      String ansB,
      String ansC,
      String ansD,
      String answer}) {
    this._questionId = questionId;
    this._question = question;
    this._ansA = ansA;
    this._ansB = ansB;
    this._ansC = ansC;
    this._ansD = ansD;
    this._answer = answer;
  }

  int get questionId => _questionId;
  set questionId(int questionId) => _questionId = questionId;
  String get question => _question;
  set question(String question) => _question = question;
  String get ansA => _ansA;
  set ansA(String ansA) => _ansA = ansA;
  String get ansB => _ansB;
  set ansB(String ansB) => _ansB = ansB;
  String get ansC => _ansC;
  set ansC(String ansC) => _ansC = ansC;
  String get ansD => _ansD;
  set ansD(String ansD) => _ansD = ansD;
  String get answer => _answer;
  set answer(String answer) => _answer = answer;

  Questions.fromJson(Map<String, dynamic> json) {
    _questionId = json['question_id'];
    _question = json['question'];
    _ansA = json['ans_a'];
    _ansB = json['ans_b'];
    _ansC = json['ans_c'];
    _ansD = json['ans_d'];
    _answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this._questionId;
    data['question'] = this._question;
    data['ans_a'] = this._ansA;
    data['ans_b'] = this._ansB;
    data['ans_c'] = this._ansC;
    data['ans_d'] = this._ansD;
    data['answer'] = this._answer;
    return data;
  }
}
