
import 'package:e_commerce_admin/model/product.dart';
import 'package:e_commerce_admin/provider/firestore_provider.dart';
import 'package:e_commerce_admin/screens/product_screens/update_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  String catId;
  ProductWidget({required this.product,required this.catId,Key? key}) : super(key: key);

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
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  const Spacer(),
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
                            Text(product.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(primary: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)) ),

                                  onPressed: (){
                                    Provider.of<FireStoreProvider>(context,listen:false).productNameController.text=product.name;
                                    Provider.of<FireStoreProvider>(context,listen:false).productDescriptionController.text=product.description;
                                    Provider.of<FireStoreProvider>(context,listen:false).productPriceController.text=product.price.toString();
                                    Provider.of<FireStoreProvider>(context,listen:false).productQuantityController.text=product.quantitiy.toString();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProduct(product: product, catId: catId)));
                                  }, child: const Text('update')),

                            ),
                            const SizedBox(width: 10,),
                            IconButton(onPressed: (){
                              Provider.of<FireStoreProvider>(context,listen:false).deleteProduct(product,catId);

                            }, icon: const Icon(Icons.delete,color: Colors.black,size: 20)),
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
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
