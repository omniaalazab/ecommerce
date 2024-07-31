import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/ui/accessories.dart';
import 'package:ecommerce/views/ui/bags.dart';
import 'package:ecommerce/views/ui/home.dart';
import 'package:ecommerce/views/ui/hoodies.dart';
import 'package:ecommerce/views/ui/shoes.dart';
import 'package:ecommerce/views/ui/shorts.dart';
import 'package:ecommerce/views/widget/shared_widget/shoping_by_category.dart';
import 'package:flutter/material.dart';

class ShopByCategory extends StatelessWidget {
  const ShopByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorHelper.darkpurple,
        body: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            CircleAvatar(
              backgroundColor: ColorHelper.purple,
              child: InkWell(
                child: const Icon(Icons.arrow_back_ios_new_rounded),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => const Home()));
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Shop by Categories",
              style: TextStyleHelper.textStylefontSize20
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            CategorySearch(
              onPressedFunction: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const Hoodies()));
              },
              categoryImage: 'assets/images/Ellipse1.png',
              categoryName: 'Hoodies',
            ),
            const SizedBox(
              height: 20,
            ),
            CategorySearch(
              onPressedFunction: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const Accessories()));
              },
              categoryImage: 'assets/images/Ellipse2.png',
              categoryName: 'Accessories',
            ),
            const SizedBox(
              height: 20,
            ),
            CategorySearch(
              categoryImage: 'assets/images/Ellipse 3.png',
              categoryName: 'Shorts',
              onPressedFunction: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const Shorts()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CategorySearch(
              categoryImage: 'assets/images/Ellipse4.png',
              categoryName: 'Shoes',
              onPressedFunction: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const Shoes()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CategorySearch(
              categoryImage: 'assets/images/Ellipse 5.png',
              categoryName: 'Bags',
              onPressedFunction: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const Bags()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
