class Category{
  String? id;
  late String name;
  late String imageUrl;

  Category({required this.name,required this.imageUrl});

  Category.fromMap(Map<String,dynamic> map){
    id=map['id'];
    name=map['name'];
    imageUrl=map['imageUrl'];
  }
  Map<String,dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['name'] = name;
    map['imageUrl'] = imageUrl;
    return map;
  }
}