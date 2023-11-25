import 'package:flutter/material.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/core/utils/media_query_values.dart';
import 'package:save/core/utils/style_manager.dart';

Widget buildpetsItem({
  required BuildContext context,
  required String imgUrl,
  required String phone,
  required String gender,
  required String address,
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 10.0,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              height: context.height * 0.5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.height * 0.32,
                      width: double.infinity,
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Phone : $phone",
                        style: getRegularStyle(
                            color: AppColors.darkBrown, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Gender : $gender",
                        style: getRegularStyle(
                            color: AppColors.darkBrown, fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Address : $address",
                            style: getRegularStyle(
                                color: AppColors.darkBrown, fontSize: 18),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Aviable",
                            style:
                                getBoldStyle(color: Colors.green, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
