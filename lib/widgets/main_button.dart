import 'package:flutter/material.dart';
import 'package:name/utils/theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 45.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ThemeColor.mainYellow,
          borderRadius: BorderRadius.circular(20.0),
        ),
        alignment: Alignment.center,
        child: Text(
          'Купить',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
