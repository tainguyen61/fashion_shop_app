class BillDetailModel {
  String id;
  String productId;
  String img;
  String color;
  String size;
  String category;
  String name;
  int price;
  int quantity;
  int subTotal;
  String time;
  String status;
  String address;
  String userName;
  String userPhone;

  BillDetailModel(
      {required this.id,
      required this.productId,
      required this.img,
      required this.color,
      required this.size,
      required this.category,
      required this.name,
      required this.price,
      required this.quantity,
      required this.subTotal,
      required this.time,
      required this.status,
      required this.address,
      required this.userName,
      required this.userPhone});

  BillDetailModel.fromSnapshot(snapshot)
      : id = snapshot.id,
        productId = snapshot.data()['productId'],
        img = snapshot.data()['img'],
        color = snapshot.data()['color'],
        size = snapshot.data()['size'],
        category = snapshot.data()['category'],
        name = snapshot.data()['name'],
        price = snapshot.data()['price'],
        quantity = snapshot.data()['quantity'],
        subTotal = snapshot.data()['subTotal'],
        time = snapshot.data()['time'],
        status = snapshot.data()['status'],
        address = snapshot.data()['address'],
        userName = snapshot.data()['userName'],
        userPhone = snapshot.data()['userPhone'];
}

class BillDetailItem{
  String productId;
  String img;
  String color;
  String size;
  String category;
  String name;
  int price;

  BillDetailItem({required this.productId,required this.img,required this.color,required this.size,required this.category,
    required this.name,required this.price});
}