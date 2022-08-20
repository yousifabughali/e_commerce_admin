class AppUser {
  late String email;
  String? id;
  String? password;
  late String userName;
  late String phone;

  AppUser({
    this.id,
    required this.email,
    this.password,
    required this.userName,
    required this.phone,
  });

  AppUser.fromMap(Map<String, dynamic> map) {
      email= map['email'];
      userName= map['userName'];
      phone= map['phone'] ;
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'userName': userName,
      'phone': phone,
    };
  }
}
