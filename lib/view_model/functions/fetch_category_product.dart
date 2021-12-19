import 'dart:convert';

import 'package:hring_task/model/product_data.dart';
import 'package:http/http.dart'as http;
getProductByCategories(String category) async {
  String url = "https://fakestoreapi.com/products/category"+"/$category";
  final response = await http.get(Uri.parse(url));
  var responseData = json.decode(response.body);
  print(responseData);
  List<ProductData> products=[];
  for(var singleProduct in responseData){
    ProductData product = ProductData(name: singleProduct["title"], price: singleProduct["price"].toString(), category: singleProduct["category"], imageUrl:singleProduct["image"],id: singleProduct["id"]);
    products.add(product);
  }

  return products;
}