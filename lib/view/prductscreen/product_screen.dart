import 'package:flutter/material.dart';
import 'package:zilmoney_task/model/product_model.dart';
import 'package:zilmoney_task/view/prductscreen/widgets/product_container.dart';
import 'package:zilmoney_task/view/utils/const_widgets.dart';
import 'package:zilmoney_task/view/utils/custom_colors.dart';

class ProductScreen extends StatelessWidget {
  final List<ProductModel> listProductModel;
  const ProductScreen({super.key, required this.listProductModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: kBlackColor,
        title: const Text("Products"),
        actions: const [Icon(Icons.shopping_cart), kWidth20],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10.0),
          itemCount: listProductModel.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductContainer(
                title: listProductModel[index].title.toString(),
                price: listProductModel[index].price.toString(),
                image: listProductModel[index].image.toString());
          },
        ),
      ),
    );
  }
}
