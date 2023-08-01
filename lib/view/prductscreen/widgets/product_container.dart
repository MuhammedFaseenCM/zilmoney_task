import 'package:flutter/material.dart';
import 'package:zilmoney_task/view/utils/const_widgets.dart';
import 'package:zilmoney_task/view/utils/custom_colors.dart';

class ProductContainer extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  const ProductContainer(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width / 1.5,
            height: 250.0,
            decoration: BoxDecoration(border: Border.all(color: kBlackColor)),
            child: Image.network(image),
          ),
        ),
        Text(
          title,
          maxLines: 1,
          style: const TextStyle(fontSize: 18.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "\u{20B9}$price",
            ),
            kWidth20
          ],
        )
      ],
    );
  }
}
