import 'package:flutter/material.dart';
import 'package:save/core/utils/app_colors.dart';
import 'package:save/core/utils/media_query_values.dart';
import 'package:save/core/utils/style_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onTap,
    required this.iconColors,
    required this.isIcon,
  });

  final String title;
  final VoidCallback onTap;
  final Color iconColors;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * 0.1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              AppColors.darkBrown,
              AppColors.lightBrown,
            ]),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: onTap,
                icon: Icon(
                  isIcon ? Icons.arrow_back : null,
                  color: isIcon ? iconColors : null,
                  size: 30,
                )),
            SizedBox(
              width: context.width * 0.2,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: context.height * 0.03),
                child: Text(
                  title,
                  style: getBoldStyle(color: AppColors.offWhite, fontSize: 25),
                ),
              ),
            )
          ]),
    );
  }
}
