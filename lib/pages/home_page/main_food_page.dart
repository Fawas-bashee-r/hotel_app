import 'package:flutter/material.dart';
import 'package:hotel_app/utils/colors.dart';
import 'package:hotel_app/pages/home_page/food_page_body.dart';
import 'package:hotel_app/widgets/big_text.dart';
import 'package:hotel_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 20, bottom: 15),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            width: 45,
                            height: 45,
                            child: Icon(
                              Icons.list,
                              color: AppColors.mainColor,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black45,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 235, 162, 52),
                                    offset: Offset(0, 0),
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 9,
                                  )
                                ])))
                  ]),
                ),

                // BigText(
                //   text: "India",
                //   color: AppColors.mainColor,
                // ),
                // Row(children: [
                //   Padding(
                //     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                //     child: SmallText(
                //       text: "City",
                //       color: AppColors.smalltextColor,
                //     ),
                //   ),
                //   Icon(
                //     Icons.arrow_drop_down_outlined,
                //     color: Colors.white,
                //   )
                // ])

                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 2, 0),
                  child: Text(
                    "H O T E L  A P P",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.search,
                      color: AppColors.mainColor,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black45,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 235, 162, 52),
                            offset: Offset(0, 0),
                            blurStyle: BlurStyle.outer,
                            blurRadius: 9,
                          )
                        ]),
                  ),
                )
              ]),
              Expanded(
                  child: SingleChildScrollView(
                child: FoodPageBody(),
              ))
            ])));
  }
}
