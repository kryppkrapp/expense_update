import 'package:flutter/material.dart';

class CustomTextIcon extends StatelessWidget {
  const CustomTextIcon({
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.textColor,
    required this.textSize,
    required this.iconSize,
    required this.onPressed,
    super.key,
  });

  final String text;
  final IconData icon;
  final Color textColor;
  final Color iconColor;
  final double textSize;
  final double iconSize;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            // const SizedBox(
            //   height: 6,
            // ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
