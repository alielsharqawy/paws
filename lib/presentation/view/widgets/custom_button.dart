import 'package:flutter/material.dart';
import 'package:save/core/utils/style_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.lable,
    required this.height,
    required this.width,
    required this.onTap,
    required this.isOutlined,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);
  final String lable;
  final double height;
  final double width;
  final VoidCallback onTap;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const StadiumBorder(),
          side: isOutlined == true
              ? const BorderSide(
                  width: 2,
                  color: Colors.white,
                )
              : BorderSide.none,
        ),
        child:
            Text(lable, style: getMediumStyle(color: textColor!, fontSize: 20)),
      ),
    );
  }
}
