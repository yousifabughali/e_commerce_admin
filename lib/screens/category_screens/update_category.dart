
import 'package:e_commerce_admin/model/Category.dart';
import 'package:e_commerce_admin/provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateCategory extends StatelessWidget {
  Category category;

  UpdateCategory({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context, fireStoreProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Update Categorey',style: TextStyle(color: Colors.black),),
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
                    backgroundImage: NetworkImage(category.imageUrl),
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
                    await fireStoreProvider.updateCategory(category);
                    Navigator.pop(context);
                  },
                  child: Text('Update Category'),
                ),

              ],
            ),
          ),
        ),
      );
    });
  }
}
