import 'dart:io';

import 'package:e_commerce_admin/helpers/storage_helper.dart';
import 'package:e_commerce_admin/provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  String catId;

  AddProduct(this.catId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context, fireStoreProvider, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Add New Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Form(
              key: fireStoreProvider.addNewProductKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      fireStoreProvider.selectImage();
                    },
                    child: fireStoreProvider.selectedImage == null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/addImage.png'),
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
                    validator: fireStoreProvider.requiredValidator,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.category_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                      label: Text('Product Name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    controller: fireStoreProvider.productNameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: fireStoreProvider.requiredValidator,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.description,
                        color: Colors.black,
                        size: 18,
                      ),
                      label: Text('Product Description'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    controller: fireStoreProvider.productDescriptionController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: fireStoreProvider.requiredValidator,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.monetization_on,
                        color: Colors.black,
                        size: 18,
                      ),
                      label: Text('Product Price'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    controller: fireStoreProvider.productPriceController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: fireStoreProvider.requiredValidator,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_shopping_cart_sharp,
                        color: Colors.black,
                        size: 18,
                      ),
                      label: Text('Product quantity'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    controller: fireStoreProvider.productQuantityController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: () async {
                      await fireStoreProvider.addNewProduct(catId);
                      fireStoreProvider.selectedImage = null;
                      fireStoreProvider.productNameController.text = '';
                      fireStoreProvider.productDescriptionController.text = '';
                      fireStoreProvider.productQuantityController.text = '';
                      fireStoreProvider.productPriceController.text = '';
                      // Navigator.pop(context);
                    },
                    child: Text('Add New Product'),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
