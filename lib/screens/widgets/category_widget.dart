import 'package:e_commerce_admin/app_router/router.dart';
import 'package:e_commerce_admin/model/Category.dart';
import 'package:e_commerce_admin/provider/firestore_provider.dart';
import 'package:e_commerce_admin/screens/category_screens/update_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  Category category;

  CategoryWidget({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Spacer(),
                  Stack(
                    children: [
                      Container(
                        height:50,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Text(
                              category.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25))),
                                  onPressed: () {
                                    Provider.of<FireStoreProvider>(context,
                                        listen: false)
                                        .categoryNameController
                                        .text = category.name;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateCategory(category: category)));
                                  },
                                  child: Text('update')),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {
                                  Provider.of<FireStoreProvider>(context,
                                      listen: false)
                                      .deleteCategory(category);
                                },
                                icon: Icon(Icons.delete,
                                    color: Colors.black, size: 20),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

