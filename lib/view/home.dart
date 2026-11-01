import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:name/utils/theme.dart';
import 'package:name/widgets/product_card.dart';
import 'package:name/widgets/custom_drawer.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Product> productList = [
    Product(
      icon: PngIcon.pizza,
      productName: 'Дерзкая Марго',
      rating: '4,8',
      cost: '350',
      deliveryTime: '25-30 мин',
    ),
    Product(
      icon: PngIcon.burger,
      productName: 'Горячий парень',
      rating: '4,5',
      cost: '850',
      deliveryTime: '25-30 мин',
    ),
    Product(
      icon: PngIcon.fruit,
      productName: 'Вкусняшка Миа',
      rating: '3,9',
      cost: '620',
      deliveryTime: '25-30 мин',
    ),
    Product(
      icon: PngIcon.meet,
      productName: 'Сытый Питт',
      rating: '4,3',
      cost: '1200',
      deliveryTime: '25-30 мин',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 170,
        backgroundColor: ThemeColor.background,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 15),
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: SvgPicture.asset(SvgIcon.menu),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  'Челябинск',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(width: 16),
                SvgPicture.asset(SvgIcon.chevronDown),
                Spacer(),
                SvgPicture.asset(SvgIcon.cart),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(SvgIcon.allMenu),
                    const SizedBox(height: 5),
                  ],
                ),
                SizedBox(width: 35),
                Column(
                  children: [
                    SvgPicture.asset(SvgIcon.pizzaMenu),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(width: 35),
                Column(
                  children: [
                    SvgPicture.asset(SvgIcon.kebabMenu),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(width: 35),
                Column(
                  children: [
                    SvgPicture.asset(SvgIcon.burgerMenu),
                    SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: ThemeColor.background,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: productList
              .map(
                (e) => ProductCard(
                  icon: e.icon,
                  productName: e.productName,
                  rating: e.rating,
                  cost: e.cost,
                  deliveryTime: e.deliveryTime,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class Product {
  final String icon;
  final String productName;
  final String rating;
  final String cost;
  final String deliveryTime;

  Product({
    required this.icon,
    required this.productName,
    required this.rating,
    required this.cost,
    required this.deliveryTime,
  });
}
