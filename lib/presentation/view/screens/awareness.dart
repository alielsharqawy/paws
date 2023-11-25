import 'package:flutter/material.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/core/utils/media_query_values.dart';
import 'package:save/core/utils/style_manager.dart';

class AwarenessScreen extends StatelessWidget {
  const AwarenessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Awareness",
          style: TextStyle(color: AppColors.offWhite),
        ),
        backgroundColor: AppColors.darkBrown,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Image.asset("assets/photos/karsten-winegeart.png",
                    height: context.height * 0.4),
              ),
              Container(
                width: context.width * 0.5,
                color: AppColors.darkBrown,
                height: 2.0,
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Text(
                "Animal rescue is a much-needed social service that helps protect animals from dangerous situations that often involve cruelty and abuse. Many animals are turned into shelters due to evictions, expensive health concerns, or other unavoidable circumstances. Often it is easy to villainize the people who surrender their animals, but as animal advocates, we must keep in mind that oftentimes people are surrendering as they believe it is best for the animal or they’ve tried everything else.",
                style:
                    getRegularStyle(color: AppColors.darkBrown, fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Container(
                width: context.width * 0.5,
                color: AppColors.darkBrown,
                height: 2.0,
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Text(
                "To reduce the risk of contact with rabid animals:",
                style:
                    getRegularStyle(color: AppColors.darkBrown, fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.height * 0.03,
              ),
              Text(
                "Give the vaccine to your pets. The vaccine can be given to cats, dogs, and ferrets to protect them from rabies. Ask your veterinarian about the recommended rate of administration of the vaccine to animals.",
                style:
                    getRegularStyle(color: AppColors.darkBrown, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Text(
                "Lock up your pets. Keep your pets confined and monitor them when they go out. This helps protect him from contact with wild animals.",
                style:
                    getRegularStyle(color: AppColors.darkBrown, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Container(
                width: context.width * 0.5,
                color: AppColors.darkBrown,
                height: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
