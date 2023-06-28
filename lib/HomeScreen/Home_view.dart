
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/api_helper.dart';
import 'controller.dart';
import 'model.dart';
import 'option_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<QuizModel?>(
          future: ApiHelper.apiHelper.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              QuizModel? l1 = snapshot.data;
              List<String> quetion = [];
              List<OptionModel> options = [];
              for(Results results in l1!.results!)
              {
                print(" ${results.incorrectAnswers![0]}");
                quetion.add(results.question!);
                options.add(OptionModel(
                    a: results.incorrectAnswers![0],
                    b: results.correctAnswer!,
                    c: results.incorrectAnswers![1],
                    d: results.incorrectAnswers![2]
                ));
              }
              return Center(
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/istockphoto-1294603953-612x612.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Obx(
                          () => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${quetion[homeController.changeIndex.value]}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      if(homeController.changeIndex<9)
                                      {
                                        Get.snackbar("Congratulation", "Your Answer Current....!",backgroundColor: Colors.green);
                                        homeController.changeIndex.value++;
                                      }
                                    },
                                    child: Container(
                                      child: Text(
                                        "${options[homeController.changeIndex.value].a}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      height: 50,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo,
                                          borderRadius: BorderRadius.circular(35)),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      if(homeController.changeIndex<9)
                                      {
                                        Get.snackbar("Sorry..", "Your Answer InCorrect....!",backgroundColor: Colors.redAccent);
                                        homeController.changeIndex.value++;
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo,
                                          borderRadius: BorderRadius.circular(35)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${options[homeController.changeIndex.value].b}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: InkWell(onTap:(){
                                    if(homeController.changeIndex<9)
                                    {
                                      Get.snackbar("Sorry..", "Your Answer InCorrect....!",backgroundColor: Colors.redAccent);
                                      homeController.changeIndex.value++;
                                    }
                                  },
                                    child: Container(
                                      height: 50,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo,
                                          borderRadius: BorderRadius.circular(35)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${options[homeController.changeIndex.value].c}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      if(homeController.changeIndex<9)
                                      {
                                        Get.snackbar("Sorry..", "Your Answer InCurrent....!",backgroundColor: Colors.redAccent);
                                        homeController.changeIndex.value++;
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo,
                                          borderRadius: BorderRadius.circular(35)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${options[homeController.changeIndex.value].d}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap: (){
                              
                            },
                            child: Container(
                              child: Center(child: Text("Next",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),)),
                              height: 50,
                              width: 80,
                              color: Colors.cyan,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
