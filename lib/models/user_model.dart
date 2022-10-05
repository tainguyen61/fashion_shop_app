class UserModel{
  String? id;
  String name;
  String phone;
  String email;
  String address;

  UserModel({this.id, required this.name, required this.phone, required this.email, required this.address});

  UserModel.fromSnapshot(snapshot)
      : name = snapshot.data()['name'],
        phone = snapshot.data()['phone'],
        email = snapshot.data()['email'],
        address = snapshot.data()['address'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }
}