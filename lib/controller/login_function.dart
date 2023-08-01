import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zilmoney_task/controller/fetch_products.dart';
import 'package:zilmoney_task/model/product_model.dart';
import 'package:zilmoney_task/view/prductscreen/product_screen.dart';

fetchUserLogin({required username, required password, required context}) async {
  var url = Uri.parse("https://fakestoreapi.com/auth/login");

  Map<String, String> body = {'username': username, 'password': password};

  try {
    http.Response response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      print("Success : ${response.body}");

      List<ProductModel> listProductModel = await fetchProducts();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductScreen(listProductModel: listProductModel),
          ));
    } else {
      print("Error : ${response.statusCode}");
    }
  } on Exception catch (e) {
    print("Error : $e");
  }
}
