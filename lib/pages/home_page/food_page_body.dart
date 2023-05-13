import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/utils/colors.dart';
import 'package:hotel_app/utils/dimensions.dart';
import 'package:hotel_app/widgets/big_text.dart';
import 'package:hotel_app/widgets/small_text.dart';

import '../../widgets/icon_and_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: .9);
  var _currentPageValue = 0.0;
  double _scaleFactor = .8;
  double _height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
//slider section
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildPageItem(index);
              }),
        ),

//Dots indicator
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue.toDouble(),
          decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.fromRadius(4),
              activeSize: const Size(18, 9),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),

//popular text
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "POPULAR DISHES",
                style: TextStyle(
                    color: Color.fromARGB(255, 249, 174, 63),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 4),
              //   child: BigText(
              //     text: ".",
              //     color: Colors.white,
              //   ),
              // ),
              // SizedBox(
              //   width: 10,
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 65,
              //   child: SmallText(text: "Food Pairing"),
              // )
            ],
          ),
        ),
        //List of food
        Container(
          height: 1000,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, bottom: 15, top: 0),
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 235, 162, 52),
                                offset: Offset(0, 0),
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white38,
                            image: const DecorationImage(
                              //image section
                              image: AssetImage(
                                "assets/image/download.jpg",
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(bottom: 25),
                        height: 95,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 235, 162, 52),
                                offset: Offset(0, 0),
                                blurStyle: BlurStyle.outer,
                                blurRadius: 9,
                              )
                            ],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Colors.black87),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: BigText(
                                    text: "Malabar Biriyani",
                                    size: 19,
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: SmallText(
                                    text: "Best in Town",
                                    size: 12,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      IconAndText(
                                          icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.mainColor),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      IconAndText(
                                          icon: Icons.access_time_outlined,
                                          text: "32 minute",
                                          iconColor: AppColors.mainColor),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      IconAndText(
                                          icon: Icons.location_on_outlined,
                                          text: "2.3 km",
                                          iconColor: AppColors.mainColor),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ]),
                );
              }),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 19, bottom: 9),
            decoration: BoxDecoration(
                //  color: Color.fromARGB(66, 0, 0, 0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 235, 162, 52),
                    offset: Offset(0, 0),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 9,
                  )
                ],
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/download.jpg"),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              width: 300,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 9, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black87,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 235, 162, 52),
                      //offset: Offset(4, 4),
                      blurStyle: BlurStyle.outer,
                      blurRadius: 9,
                    )
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Biriyani",
                      color: AppColors.mainColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  )),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SmallText(text: "4.5"),
                        const SizedBox(width: 10),
                        SmallText(text: "1287"),
                        const SizedBox(width: 10),
                        SmallText(text: "Reviews"),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: IconAndText(
                              icon: Icons.circle_sharp,
                              text: "Normal",
                              iconColor: AppColors.mainColor),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        IconAndText(
                            icon: Icons.access_time_outlined,
                            text: "32 minute",
                            iconColor: AppColors.mainColor),
                        SizedBox(
                          width: 8,
                        ),
                        IconAndText(
                            icon: Icons.location_on_outlined,
                            text: "2.3 km",
                            iconColor: AppColors.mainColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
