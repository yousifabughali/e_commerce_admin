import 'dart:io';

import 'package:e_commerce_admin/helpers/storage_helper.dart';
import 'package:e_commerce_admin/provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddNewCategory extends StatelessWidget {
  const AddNewCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context, fireStoreProvider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Add New Categorey',style: TextStyle(color: Colors.black),),
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: fireStoreProvider.addNewCategoryKey,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          fireStoreProvider.selectImage();
                        },
                        child: fireStoreProvider.selectedImage == null
                            ? const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,

                          backgroundImage: AssetImage('assets/images/addImage.png'),
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
                          prefixIcon: Icon(Icons.category_outlined,color: Colors.black,size: 18,),

                          label: Text('Category Name'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        controller: fireStoreProvider.categoryNameController,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)) ),

                        onPressed: () async {
                          await fireStoreProvider.addNewCategory();
                          // Navigator.pop(context);
                          fireStoreProvider.selectedImage=null;
                          fireStoreProvider.categoryNameController.text='';
                        },
                        child: Text('Add New Category'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          );
        });
  }
}
