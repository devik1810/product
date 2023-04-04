import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/provider/product_provider.dart';
import 'screen/view/product_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {'/': (context) => ProductView()},
      ),
    ),
  );
}
