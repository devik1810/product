

import 'package:flutter/cupertino.dart';

import 'package:product/utils/product_helper.dart';

class ProductProvider extends ChangeNotifier {
  List<dynamic> productList = [];

  Future<void> productApi() async {
    ProductHelper a1 = ProductHelper();
    productList = await a1.ProductApiCall() as List;


  }
}