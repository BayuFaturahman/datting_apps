import 'package:flutter/material.dart';

class StarPopularity extends StatelessWidget {
  final String views;
  final Widget icon;

  final double? width;
  final double? height;

  final EdgeInsetsGeometry? padding;

  final Color? backgroundcolor;
  final Color bodercolor;
  const StarPopularity({
    super.key,
    this.views = '',
    required this.icon,
    this.width,
    this.height,
    this.padding,
    this.backgroundcolor,
    this.bodercolor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundcolor,
        border: Border.all(color: bodercolor, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon,
          Text(
            views,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
