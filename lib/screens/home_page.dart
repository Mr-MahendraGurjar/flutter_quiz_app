import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/CommnWidgets/custom_text.dart';
import 'package:flutter_quiz_app/controller/home_controller.dart';
import 'package:flutter_quiz_app/model/quiz_model.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        return _homeController.mydata.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, right: 20),
                      child: CustomText(
                        '00:${_homeController.showtimer.value}',
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.bottomLeft,
                    child: CustomText(
                      "Question: ${_homeController.mydata[_homeController.i.value].question}",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(children: [
                    RadioListTile(
                        selected: false,
                        value: _homeController
                            .mydata[_homeController.i.value].ansA,
                        groupValue: _homeController.selectedValue.value,
                        title: CustomText(
                          _homeController.mydata[_homeController.i.value].ansA,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (index) {
                          _homeController.selectedValue.value = index;
                        }),
                    RadioListTile(
                        selected: false,
                        value: _homeController
                            .mydata[_homeController.i.value].ansB,
                        groupValue: _homeController.selectedValue.value,
                        title: CustomText(
                          _homeController.mydata[_homeController.i.value].ansB,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (index) {
                          _homeController.selectedValue.value = index;
                        }),
                    RadioListTile(
                        selected: false,
                        value: _homeController
                            .mydata[_homeController.i.value].ansC,
                        groupValue: _homeController.selectedValue.value,
                        title: CustomText(
                          _homeController.mydata[_homeController.i.value].ansC,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (index) {
                          _homeController.selectedValue.value = index;
                        }),
                    RadioListTile(
                        selected: false,
                        value: _homeController
                            .mydata[_homeController.i.value].ansD,
                        groupValue: _homeController.selectedValue.value,
                        title: CustomText(
                          _homeController.mydata[_homeController.i.value].ansD,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (index) {
                          _homeController.selectedValue.value = index;
                          print(_homeController.selectedValue.value);
                        })
                  ]),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        _homeController.saveData();
                        _homeController.selectedValue.value = '';
                        _homeController.nextquestion();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, right: 40),
                        child: CustomText(
                          'NEXT >',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              );
      })),
    );
  }
}
