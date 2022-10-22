class UserModel{
  String? id;
  String auth;
  String image;
  String name;
  String phone;
  String email;
  String address;

  UserModel({this.id,required this.auth, required this.name, required this.image, required this.phone, required this.email, required this.address});

  UserModel.fromSnapshot(snapshot)
      : auth = snapshot.data()['auth'],
        image = snapshot.data()['image'],
        name = snapshot.data()['name'],
        phone = snapshot.data()['phone'],
        email = snapshot.data()['email'],
        address = snapshot.data()['address'];

  Map<String, dynamic> toMap() {
    return {
      'auth':auth,
      'image':image,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }
}