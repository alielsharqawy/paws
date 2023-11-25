import 'package:flutter/material.dart';
import 'package:save/config/routes/app_routs.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/core/utils/media_query_values.dart';
import 'package:save/core/utils/style_manager.dart';
import 'package:save/presentation/view/screens/Awareness.dart';
import 'package:save/presentation/view/screens/help_theme_screen.dart';
import 'package:save/presentation/view/screens/pets_screen.dart';
import 'package:save/presentation/view/screens/request_screen.dart';
import 'package:save/presentation/view/widgets/custom_button.dart';
import 'package:save/presentation/view/widgets/pets_card_horezintal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Paws"),
        elevation: 0,
        backgroundColor: AppColors.darkBrown,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: AppColors.darkBrown,
            width: double.infinity,
            height: context.height * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Image.asset(
                      "assets/background/whitecircle.png",
                      height: context.height * 0.4,
                    ),
                    Positioned(
                      left: context.width * 0.15,
                      bottom: context.height * 0.03,
                      child: Image.asset(
                        "assets/photos/alvan-preview.png",
                        height: context.height * 0.5,
                      ),
                    ),
                  ]),
                  Center(
                    child: Text(
                      "Not only people need home",
                      style:
                          getBoldStyle(color: AppColors.offWhite, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Text(
                    "Kindness and compassion towards all living beings is a sign of a civilized society. Conversely, cruelty, whether directed against humans or animals, is not unique to a culture or society of people.",
                    style: getRegularStyle(
                        color: AppColors.offWhite, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  Center(
                    child: CustomButton(
                        textColor: AppColors.darkBrown,
                        backgroundColor: AppColors.offWhite,
                        lable: "Help Them",
                        height: context.height * 0.07,
                        width: context.width * 0.8,
                        onTap: () {
                          navigateTo(context, const HelpScreen());
                        },
                        isOutlined: false),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: context.height * 0.03,
          ),
          Container(
              color: AppColors.white,
              width: double.infinity,
              height: context.height * 0.35,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      petsItem(context),
                      SizedBox(
                        height: context.height * 0.03,
                      ),
                      CustomButton(
                          lable: "Explore",
                          height: context.height * 0.07,
                          width: context.width * 0.8,
                          onTap: () {
                            navigateTo(context, const PetsScreen());
                          },
                          isOutlined: false,
                          backgroundColor: AppColors.darkBrown,
                          textColor: AppColors.offWhite),
                    ],
                  ),
                  Positioned(
                    top: context.height * 0.05,
                    left: context.width * 0.3,
                    child: Image.asset(
                      "assets/leg/Iconmaterial-pets.png",
                      color: Colors.grey.withOpacity(0.5),
                      height: context.height * 0.2,
                    ),
                  ),
                ],
              )),
          Container(
            color: AppColors.grey,
            width: double.infinity,
            height: context.height * 0.7,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/photos/tamas-pap.png",
                    height: context.height * 0.4,
                  ),
                  SizedBox(
                    height: context.height * 0.075,
                  ),
                  Center(
                    child: Text(
                      "If you want to adopt a pet",
                      style: getBoldStyle(
                          color: AppColors.darkBrown, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  Center(
                    child: CustomButton(
                        textColor: AppColors.offWhite,
                        backgroundColor: AppColors.darkBrown,
                        lable: "Apply now",
                        height: context.height * 0.07,
                        width: context.width * 0.8,
                        onTap: () {
                          navigateTo(context, RequestScreen());
                        },
                        isOutlined: false),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: context.height * 0.8,
            color: AppColors.darkBrown,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/photos/richard.png",
                    height: context.height * 0.45,
                  ),
                  Center(
                    child: Text(
                      "The pet loves care and always needs it",
                      style:
                          getBoldStyle(color: AppColors.offWhite, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Text(
                    "Learn how to take care of your pet so that he loves you. Get some awareness articles about diseases and risks.",
                    style: getRegularStyle(
                        color: AppColors.offWhite, fontSize: 20),
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  Center(
                    child: CustomButton(
                        textColor: AppColors.darkBrown,
                        backgroundColor: AppColors.offWhite,
                        lable: "Start a journey",
                        height: context.height * 0.07,
                        width: context.width * 0.8,
                        onTap: () {
                          navigateTo(context, const AwarenessScreen());
                        },
                        isOutlined: false),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
