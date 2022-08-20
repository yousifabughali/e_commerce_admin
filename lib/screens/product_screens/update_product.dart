
import 'package:e_commerce_admin/model/Category.dart';
import 'package:e_commerce_admin/model/product.dart';
import 'package:e_commerce_admin/provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProduct extends StatelessWidget {
  String catId;
  Product product;

  UpdateProduct({required this.product,required this.catId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context, fireStoreProvider, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Add New Product',style: TextStyle(color: Colors.black),),
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        fireStoreProvider.selectImage();
                      },
                      child: fireStoreProvider.selectedImage == null
                          ? CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        backgroundImage: NetworkImage(product.image),
                      )
                          : CircleAvatar(
                        radius: 50,
                        backgroundImage:
                        FileImage(fireStoreProvider.selectedImage!),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: fireStoreProvider.productNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.category_outlined,color: Colors.black,size: 18,),

                        label: Text('Product Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: fireStoreProvider.productDescriptionController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.description,color: Colors.black,size: 18,),

                        label: Text('Product Description'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.monetization_on,color: Colors.black,size: 18,),
                        label: Text('Product Price'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      controller: fireStoreProvider.productPriceController,
                    ),SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.add_shopping_cart_sharp,color: Colors.black,size: 18,),

                        label: Text('Product quantity'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      controller: fireStoreProvider.productQuantityController,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)) ),
                      onPressed: () async {
                        await fireStoreProvider.updateProduct(product,catId);
                        Navigator.pop(context);
                      },
                      child: Text('Update Product'),
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
