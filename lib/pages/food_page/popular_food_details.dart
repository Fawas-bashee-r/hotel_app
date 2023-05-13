import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/Icon.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';
import '../home_page/main_food_page.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                  height: 279,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image/download.jpg"),
                        fit: BoxFit.cover),
                  ))),
          Positioned(
              top: 25,
              left: 10,
              right: 10,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppIcon(icon: Icons.arrow_back),
                    AppIcon(icon: Icons.shopping_bag_outlined)
                  ])),
          Positioned(
              left: 0.8,
              right: .8,
              top: 270,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                    backgroundBlendMode: BlendMode.clear,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 235, 162, 52),
                        offset: Offset(0, 0),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 15,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.black54),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (MainFoodPage())));
                        },
                        icon: Icon(Icons.abc_outlined),
                        label: Text("cxcx")),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
