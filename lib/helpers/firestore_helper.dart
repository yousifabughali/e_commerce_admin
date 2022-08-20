import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin/model/Category.dart';
import 'package:e_commerce_admin/model/product.dart';
import 'package:e_commerce_admin/model/user.dart';


class FireStoreHelper {
  FireStoreHelper._();

  static FireStoreHelper fireStoreHelper = FireStoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final String categoryCollectionName = 'categories';

  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection('users');

  CollectionReference<Map<String, dynamic>> categoriesCollection =
      FirebaseFirestore.instance.collection('categories');

  addUsersToFireStore(AppUser appUser) async {
    await userCollection.doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser> getUserFromFireStore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userCollection.doc(id).get();
    return AppUser.fromMap(documentSnapshot.data()!);
  }

  Future<Category> addNewCategory(Category category) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await categoriesCollection.add(category.toMap());
    category.id = documentReference.id;
    return category;
  }

  Future<List<Category>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await categoriesCollection.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Category> categories = documents.map((e) {
      Category category = Category.fromMap(e.data());
      category.id = e.id;
      return category;
    }).toList();
    return categories;
  }

  updateCategory(Category category) async {
    await categoriesCollection.doc(category.id).update(category.toMap());
  }

  deleteCategory(Category category) async {
    await categoriesCollection.doc(category.id).delete();
  }

  //products
  Future<Product> addNewProduct(Product product, String catId) async {
    DocumentReference<Map<String, dynamic>> documentReference =
    await categoriesCollection.doc(catId).collection('products').add(product.toMap());
    product.id=documentReference.id;
    return product;

  }

  Future<List<Product>> getAllProduct(String catId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await categoriesCollection.doc(catId).collection('products').get();
    List<Product> products = querySnapshot.docs.map((e) {
      Map<String,dynamic> data = e.data();
      data['id']=e.id;
      Product product = Product.fromMap(data);
      product.id = e.id;
      return product;
    }).toList();
    return products;
  }

  updateProduct(Product product, String catId) async {
    await categoriesCollection
        .doc(catId)
        .collection('products')
        .doc(product.id)
        .update(product.toMap());
  }

  deleteProduct(Product product, String catId) async {
    await categoriesCollection
        .doc(catId)
        .collection('products')
        .doc(product.id).delete();
  }
}
