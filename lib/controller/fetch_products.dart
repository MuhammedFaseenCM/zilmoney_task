import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zilmoney_task/model/product_model.dart';

Future<List<ProductModel>> fetchProducts() async {
  try {
    var url = Uri.parse("https://fakestoreapi.com/products#");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      print(json.length);
      return parseListProduct(json);
    } else {
      print("Error : ${response.statusCode}");
      return [];
    }
  } on Exception catch (e) {
    print(e);
    return [];
  }
}
