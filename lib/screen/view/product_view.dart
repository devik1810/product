
import 'package:flutter/material.dart';
import 'package:product/screen/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductProvider? ProductProviderT;
  ProductProvider? ProductProviderF;

  Future<void> getdata() async {
    await Provider.of<ProductProvider>(context,listen: false).productApi();
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    ProductProviderT = Provider.of<ProductProvider>(context, listen: true);
    ProductProviderF = Provider.of<ProductProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          centerTitle: true,
          title: Text("Product"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  ProductProviderF!.productApi();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade900),
                child: Text("Product"),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ProductProviderT!.productList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(backgroundImage: NetworkImage("${ProductProviderT!.productList[index].image}"),),
                        title: Text("${ProductProviderT!.productList[index].category}"),
                        subtitle: Text(
                          "${ProductProviderT!.productList[index].title}",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        trailing: Text(
                          "${ProductProviderT!.productList[index].price}",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}