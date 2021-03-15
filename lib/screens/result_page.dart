import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/CommnWidgets/custom_text.dart';
import 'package:flutter_quiz_app/controller/home_controller.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [
          Container(
            height: Get.height * 0.8,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CustomText(
                    "${_homeController.customData[index].questionName} >",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  trailing: CustomText(
                    _homeController.customData[index].selectedAnswer,
                    fontWeight: FontWeight.bold,
                    color: _homeController.customData[index].selectedAnswer ==
                            "Right"
                        ? Colors.orange
                        : (_homeController.customData[index].selectedAnswer ==
                                "Wrong"
                            ? Colors.red
                            : Colors.blue),
                  ),
                );
              },
              itemCount: _homeController.customData.length,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              CustomText(
                "Total Right Questions : ${_homeController.rightQuestion.value.toString()}",
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                "Total Wrong Questions : ${_homeController.wrongQuestion.value.toString()}",
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                "Total No Answer Questions : ${_homeController.notAnswer.value.toString()}",
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ],
          )
      ],
    ),
        ));
  }
}
