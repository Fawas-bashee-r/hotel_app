import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color? bgColor;
  final Color? iconColor;
  final double? size;
  const AppIcon(
      {super.key,
      required this.icon,
      this.bgColor = const Color.fromARGB(140, 20, 17, 17),
      this.iconColor = const Color.fromARGB(255, 249, 174, 63),
      this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 235, 162, 52),
            offset: Offset(0, 0),
            blurStyle: BlurStyle.outer,
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(size! / 2),
        color: bgColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
