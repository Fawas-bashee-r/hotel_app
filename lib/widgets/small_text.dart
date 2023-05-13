import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  SmallText(
      {super.key,
      this.height = 1.2,
      this.color,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(color: Colors.white, fontSize: size, height: height),
    );
  }
}
