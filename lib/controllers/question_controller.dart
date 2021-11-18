import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/score/score_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
            id: question["id"],
            question: question["question"],
            options: question["options"],
            answer: question["answer_index"],
          ))
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswerd => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numberOfCorrectAns = 0;
  int get numberOfCorrectAns => this._numberOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        //Update é tipo o SetState
        update();
      });

    //Começo da animação
    //Quando expira 60s irá para a próxima questão

    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    //Parar o Contador
    if (correctAns == _selectedAns) _numberOfCorrectAns++;
    _animationController.stop();
    update();
    /*
    Quando o usuário escolher uma resposta, conta 3 segundos e passa para a
    próxima questão*/
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward();
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updatadeQnNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
