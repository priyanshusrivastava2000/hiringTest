import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

List<String> categories = [];
List<Tab> categoryTabs =[];
 Future<List<String>> getCategories() async {
  String url = "https://fakestoreapi.com/products/categories";
  final response = await http.get(Uri.parse(url));
  var responseData = json.decode(response.body);

  for (int i=0;i<responseData.length;i++)
    {
      categories.add(responseData[i]);
      categoryTabs.add(Tab(text: responseData[i].toString().toUpperCase()));
    }


  return categories;
}