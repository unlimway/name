import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name/utils/theme.dart';
import 'package:name/view/detail_page.dart';
import 'package:name/widgets/main_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.icon,
    required this.productName,
    required this.rating,
    required this.cost,
    required this.deliveryTime,
  });

  final String icon;
  final String productName;
  final String rating;
  final String cost;
  final String deliveryTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300.0,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            icon,
            height: 165.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          descriptionBlock(context),
        ],
      ),
    );
  }

  Widget descriptionBlock(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: Column(
        children: [
          textBlock(),
          SizedBox(height: 20.0),
          MainButton(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => DetailPage(
                    productName: productName,
                    productCost: cost,
                    productRating: rating,
                    productImage: icon,
                    deliveryTime: deliveryTime,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget textBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        nameAndRating(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '₽ ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: ThemeColor.textDescription,
                ),
              ),
            ),
            Text(
              cost,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32.0,
                color: ThemeColor.text,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget nameAndRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.0,
            color: ThemeColor.text,
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(SvgIcon.star),
            SizedBox(width: 7.0),
            Text(
              rating.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                color: ThemeColor.text,
              ),
            ),
            SizedBox(width: 11.0),
            Text(
              '(100+)',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14.0,
                color: ThemeColor.textDescription,
              ),
            ),
            SizedBox(width: 17.0),
            Text(
              deliveryTime,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                color: ThemeColor.text,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
