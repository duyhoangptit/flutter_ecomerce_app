import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/size_config.dart';
import 'package:flutter_svg/svg.dart';

class Categories extends StatelessWidget {

  final List<Map<String, dynamic>> categories = [
    {
      "icon": "assets/icons/Flash Icon.svg",
      "text": "Flash Deal"
    },
    {
      "icon": "assets/icons/Bill Icon.svg",
      "text": "Bill"
    },
    {
      "icon": "assets/icons/Game Icon.svg",
      "text": "Game"
    },
    {
      "icon": "assets/icons/Gift Icon.svg",
      "text": "Daily Gift"
    },
    {
      "icon": "assets/icons/Discover.svg",
      "text": "More"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)), // co gian 2 ben chieu ngang 20px
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // co dan deu tren mot dong
        crossAxisAlignment:  CrossAxisAlignment.start, // bat dau tai diem tren cung
        children: [
          ...List.generate(categories.length, (index)
          => CategoryCard(press: () {}, icon: categories[index]["icon"], text: categories[index]["text"]))
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.press,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final GestureTapCallback press;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                    color: Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
