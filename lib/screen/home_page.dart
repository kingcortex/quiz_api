import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quiz_api/components/categorie_widget.dart';
import 'package:quiz_api/model/categorie_model.dart';
import 'package:quiz_api/provider/game_provider.dart';
import 'package:quiz_api/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Categorie> categories = [
    Categorie(title: 'Linux', image: "assets/categorie_img/linux.png"),
    Categorie(title: 'DevOps', image: "assets/categorie_img/devops.png"),
    Categorie(title: 'Docker', image: "assets/categorie_img/docker.png"),
    Categorie(
        title: 'Networking', image: "assets/categorie_img/networking.png"),
    Categorie(title: 'code', image: "assets/categorie_img/programming.png"),
    Categorie(title: 'Cloud', image: "assets/categorie_img/cloud.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(70),
          Stack(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Lottie.asset(
                    "assets/annimations/animationbgremoved.json",
                    width: MediaQuery.of(context).size.width * 0.54),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Column(
                  children: [
                    Gap(
                      MediaQuery.of(context).size.height * 0.002,
                    ),
                    buildTitle(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          top: MediaQuery.of(context).size.width * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello Souleymane",
                                style: AppTheme.textStyle(
                                    fontSize: 20, fontWeight_: FontWeight.w700),
                              ),
                              Text(
                                "Ready for another Challenge?",
                                style: AppTheme.textStyle(fontSize: 10),
                              ),
                              Gap(MediaQuery.of(context).size.height * 0.013),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppTheme.primeryTextColor,
                                      width: 1,
                                    ),
                                    top: BorderSide(
                                      color: AppTheme.primeryTextColor,
                                      width: 1,
                                    ),
                                    left: BorderSide(
                                      color: AppTheme.primeryTextColor,
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: AppTheme.primeryTextColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            "assets/icon_app/trophee.png"),
                                      ),
                                      const Gap(5),
                                      Consumer<GameProvider>(
                                        builder:
                                            (context, gameProvider, child) {
                                          return Text(
                                            gameProvider.points.toString(),
                                            style: AppTheme.textStyle(),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.06),
              decoration: BoxDecoration(
                color: AppTheme.primeryTextColor.withOpacity(0.98),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Explore Quizzes",
                        style: AppTheme.textStyle(
                            color: AppTheme.primaryColor,
                            fontWeight_: FontWeight.w900),
                      ),
                      Text(
                        "view all",
                        style: AppTheme.textStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 15,
                            fontWeight_: FontWeight.bold),
                      )
                    ],
                  ),
                  const Gap(20),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, i) => CategorieWidget(
                        title: categories[i].title,
                        imgage: categories[i].image,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildTitle() {
  return Transform.scale(
    scale: 0.8,
    child: Stack(
      children: [
        Text(
          "Quiz",
          style: AppTheme.textStyle(
            color: AppTheme.primeryTextColor,
            fontSize: 40,
            fontWeight_: AppTheme.semiBold,
          ),
        ),
        Transform.translate(
          offset: const Offset(50, 35),
          child: Text(
            "Api",
            style: AppTheme.textStyle(
                color: AppTheme.yellow,
                fontSize: 20,
                fontWeight_: AppTheme.semiBold),
          ),
        )
      ],
    ),
  );
}
