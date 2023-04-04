import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:product/screen/model/product_model.dart';

class ProductHelper {
  Future<List> ProductApiCall() async {
    List<dynamic>productjsonList=[];
    String productlink = "https://fakestoreapi.com/products";

    Uri uri = Uri.parse(productlink);
    var resonse = await http.get(uri);
    var json = jsonDecode(resonse.body);

    productjsonList = json.map((e)=> ProductModel().fromJson(e)).toList();
    return productjsonList;

  }
}