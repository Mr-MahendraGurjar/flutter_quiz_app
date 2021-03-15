import 'dart:async';
import 'dart:convert';
import 'package:flutter_quiz_app/model/custom_model.dart';
import 'package:flutter_quiz_app/model/quiz_model.dart';
import 'package:flutter_quiz_app/screens/result_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<Questions> mydata = List<Questions>().obs;
  List<CustomModel> customData = List<CustomModel>().obs;
  RxBool canceltimer = false.obs;
  RxInt i = 0.obs;
  RxInt j = 0.obs;
  RxInt radioValue = 0.obs;
  RxInt timer = 60.obs;
  RxInt showtimer = 60.obs;
  QuizModel quizModel;
  RxString selectedValue = ''.obs;
  RxInt rightQuestion = 0.obs;
  RxInt wrongQuestion = 0.obs;
  RxInt notAnswer = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void saveData() {
    if (selectedValue.value == mydata[i.value].answer) {
      customData.add(CustomModel('Question ${i.value + 1}', 'Right'));
      rightQuestion.value++;
    } else if (selectedValue.value == '') {
      customData.add(CustomModel('Question ${i.value + 1}', 'Not Answer'));
      notAnswer.value++;
    } else {
      customData.add(CustomModel('Question ${i.value + 1}', 'Wrong'));
      wrongQuestion.value++;
    }
  }

  void fetchProducts() async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://demoapp.in/practical/practical.php'));
      quizModel = QuizModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        mydata.addAll(
            QuizModel.fromJson(json.decode(response.body)).dATA.questions);
        starttimer();
      }
    } catch (e) {
      print(e.toString());
      print("something wrong");
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      if (timer.value < 1) {
        t.cancel();
        saveData();
        selectedValue.value = '';
        nextquestion();
      } else if (canceltimer.value == true) {
        t.cancel();
      } else {
        timer.value--;
        print(timer.value);
      }
      showtimer.value = timer.value;
    });
  }

  void nextquestion() {
    canceltimer.value = false;
    timer.value = 60;
    print(timer.value);
    if (j < mydata.length - 1) {
      i.value = mydata[j.value].questionId;
      j++;
    } else {
      Get.off(ResultPage());
    }
    starttimer();
  }
}
