import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name/utils/theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 60.0),
      child: Column(
        children: [
          rowWithAvatar(),
          SizedBox(height: 30.0),
          drawerButton(title: 'Bcе меню'),
          drawerButton(title: 'Заказы', counter: '6'),
          drawerButton(title: 'Корзина', counter: '3', hasCircle: true),
        ],
      ),
    );
  }

  Widget rowWithAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(PngIcon.avatar, height: 45.0, width: 45.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Juanita Nguyen',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: ThemeColor.text,
              ),
            ),
            Text(
              'somemail@mail.ru',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: ThemeColor.text,
              ),
            ),
          ],
        ),
        SvgPicture.asset(SvgIcon.logout, height: 24.0, width: 24.0),
      ],
    );
  }

  Widget drawerButton({
    required String title,
    String? counter,
    bool hasCircle = false,
  }) {
    return SizedBox(
      height: 45.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: ThemeColor.text,
            ),
          ),
          if (counter != null)
            Container(
              height: 22.0,
              width: 22.0,
              decoration: BoxDecoration(
                color: hasCircle ? ThemeColor.mainYellow : Colors.transparent,
                borderRadius: BorderRadius.circular(22.0),
              ),
              alignment: Alignment.center,
              child: textCounter(counter),
            ),
        ],
      ),
    );
  }

  Widget textCounter(String counter) {
    return Text(
      counter,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: ThemeColor.textDescription,
      ),
    );
  }
}
