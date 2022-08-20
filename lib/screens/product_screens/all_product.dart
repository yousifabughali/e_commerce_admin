import 'package:e_commerce_admin/app_router/router.dart';
import 'package:e_commerce_admin/provider/firestore_provider.dart';
import 'package:e_commerce_admin/screens/product_screens/add_product.dart';
import 'package:e_commerce_admin/screens/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  String catId;

  ProductsScreen(this.catId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context, fireStoreProvider, x) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('All Products',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            // AppRouter.NavigateToWidget(AddProduct(catId));

            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddProduct(catId)));

          },
          child: Icon(Icons.add,color: Colors.white,),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: fireStoreProvider.products.length,
          itemBuilder: (context, index) {
            return ProductWidget(
                product: fireStoreProvider.products[index], catId: catId);
          },
        ),
      );
    });
  }
}
