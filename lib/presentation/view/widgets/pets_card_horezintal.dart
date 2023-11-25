import 'package:flutter/material.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/core/utils/media_query_values.dart';
import 'package:save/core/utils/style_manager.dart';

Widget petsItem(BuildContext context) => Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 10.0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.white),
            height: context.height * 0.12,
            child: Row(
              children: [
                Image.asset(
                  "assets/photos/mohammad-emami.png",
                  height: context.height * 0.5,
                ),
                SizedBox(
                  width: context.width * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "0101001000",
                      style: getRegularStyle(
                          color: AppColors.darkBrown, fontSize: 15),
                    ),
                    Text(
                      "Jehan elsadat , Mansoura ,Daq",
                      style: getRegularStyle(
                          color: AppColors.darkBrown, fontSize: 15),
                    ),
                    Text(
                      "Male",
                      style: getRegularStyle(
                          color: AppColors.darkBrown, fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
