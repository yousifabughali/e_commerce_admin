import 'package:e_commerce_admin/app_router/router.dart';

import 'package:e_commerce_admin/provider/firestore_provider.dart';
import 'package:e_commerce_admin/screens/category_screens/addNewCategoryScreen.dart';
import 'package:e_commerce_admin/screens/product_screens/add_product.dart';
import 'package:e_commerce_admin/screens/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../product_screens/all_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context, fireStoreProvider, x) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('All Categories',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),

        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewCategory()));
        },
          child: Icon(Icons.add,color: Colors.white,),
        ),
        body: ListView.builder(
                itemCount: fireStoreProvider.categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      await fireStoreProvider.getAllProduct(fireStoreProvider.categories[index].id!);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen(fireStoreProvider.categories[index].id!)));
                      // AppRouter.NavigateToWidget(ProductsScreen(
                      //     fireStoreProvider.categories[index].id!));
                    },
                    child: CategoryWidget(
                        category: fireStoreProvider.categories[index]),
                  );
                },
              ),
      );
    });
  }
}
