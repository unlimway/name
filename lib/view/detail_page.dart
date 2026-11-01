import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name/utils/theme.dart';
import 'package:name/widgets/main_button.dart';

class DetailPage extends StatelessWidget {
  final String productName;
  final String productCost;
  final String productRating;
  final String productImage;
  final String deliveryTime;

  const DetailPage({
    super.key,
    required this.productName,
    required this.productCost,
    required this.productRating,
    required this.productImage,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                productImage,
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 50,
                left: 30,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(
                      'assets/svg/chevron_left.svg',
                      height: 24,
                      width: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 30,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(SvgIcon.cart, height: 24, width: 24),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heart(),
                    titleAndPrice(),
                    ratingAndDelivery(),
                    descriptionBlock(),
                    buyButton(context),
                    blockExtras(),
                    blockRecomendation(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget heart() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [SvgPicture.asset(SvgIcon.heart, height: 24, width: 24)],
      ),
    );
  }

  Widget titleAndPrice() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            productName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: ThemeColor.text,
            ),
          ),
          SizedBox(
            height: 45,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
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
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    productCost,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: ThemeColor.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ratingAndDelivery() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          SvgPicture.asset(SvgIcon.star, height: 14, width: 14),
          SizedBox(width: 7),
          Text(
            productRating.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: ThemeColor.text,
            ),
          ),
          SizedBox(width: 11),
          Text(
            '(100+)',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14,
              color: ThemeColor.textDescription,
            ),
          ),
          SizedBox(width: 17),
          Text(
            deliveryTime,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: ThemeColor.text,
            ),
          ),
        ],
      ),
    );
  }

  Widget descriptionBlock() {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.0),
      child: Text(
        'Et consectetur commodo ut consectetur ex nulla voluptate '
        'commodo ipsum incididunt qui dolor.',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Color(0xff000000),
        ),
      ),
    );
  }

  Widget buyButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: MainButton(onTap: () {}),
      ),
    );
  }

  Widget blockExtras() {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          blockExtrasButton('Дополнительно', true),
          blockExtrasButton('Похожие', false),
          blockExtrasButton('Отзывы', false),
        ],
      ),
    );
  }

  Widget blockExtrasButton(String title, bool isActive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isActive ? ThemeColor.text : ThemeColor.textDescription,
          ),
        ),
        SizedBox(height: 4),
        if (isActive)
          Container(
            height: 2,
            width: 44,
            decoration: BoxDecoration(
              color: ThemeColor.text,
              borderRadius: BorderRadius.circular(2),
            ),
          )
        else
          SizedBox(height: 2),
      ],
    );
  }

  Widget blockRecomendation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14),
        extras(
          image: PngIcon.coffee,
          name: 'Просто кофе',
          description: 'Вкусный зерновой кофе',
          cost: '200',
        ),
        extras(
          image: PngIcon.coffee,
          name: 'Просто кофе',
          description: 'Вкусный зерновой кофе',
          cost: '200',
        ),
        extras(
          image: PngIcon.coffee,
          name: 'Просто кофе',
          description: 'Вкусный зерновой кофе',
          cost: '200',
        ),
        extras(
          image: PngIcon.coffee,
          name: 'Просто кофе',
          description: 'Вкусный зерновой кофе',
          cost: '200',
        ),
      ],
    );
  }

  Widget extras({
    required String image,
    required String name,
    required String description,
    required String cost,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 61,
            height: 61,
            decoration: BoxDecoration(
              color: ThemeColor.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ThemeColor.text,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: ThemeColor.textDescription,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '$cost руб',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ThemeColor.text,
            ),
          ),
        ],
      ),
    );
  }
}
