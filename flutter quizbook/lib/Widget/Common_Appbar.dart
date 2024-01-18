import 'package:flutter/material.dart';
import 'package:quiz_2/Utils/Constanc.dart';

// gpt
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? leadingOnPressed;
  final bool centertile;
  final bool isBackArrow;
  final double letterSpacing;

  CommonAppBar({
    required this.title,
    this.leadingOnPressed,
    this.centertile = true,
    this.isBackArrow = false,
    this.letterSpacing = 1,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackArrow ? BackButton(color: BlackColor) : SizedBox.shrink(),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      centerTitle: true,

      // Add any other properties you need for customization
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
